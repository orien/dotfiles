
_aws_profiles() {
  awk '/^\[profile/ { sub(/\]$/, "", $2); print $2 }' ~/.aws/config
}

_stackmaster_stacks() {
  local config="$1"
  ruby -r yaml << RUBY
    YAML.load_file("$config")["stacks"].each do |region, stacks|
      stacks.each do |s, _|
        puts("#{region} #{s}")
      end
    end
RUBY
}

_stackmaster_configs() {
  find . -name stack_master.yml
}

_stackmaster_account() {
  local config="$1"
  ruby -r yaml -e "puts Array(YAML.load_file('$config').dig('stack_defaults', 'allowed_accounts')).first"
}

_stackmaster_commands() {
  local commands=(apply diff validate compile outputs events resources lint nag drift delete)
  printf '%s\n' "${commands[@]}"
}

sm() {
  local sm_command="${1:-}"

  local config
  if [ -f ./stack_master.yml ]; then
    config="./stack_master.yml"
  else
    config="$(_stackmaster_configs | fzf --header="Select a Stack Master configuration" --preview="bat -f --style=header,grid {}")" || return
  fi

  local region_and_stack
  region_and_stack="$(_stackmaster_stacks "$config" | \
    fzf --header="Select stack" \
        --preview "ruby -r yaml -e \"region, stack = {}.split(' ', 2)
          stack_yml = YAML.load_file('$config').dig('stacks', region, stack)
          exit unless stack_yml
          system(%Q{echo \\\"#{YAML.dump({stack => stack_yml})}\\\" | bat --file-name=stack_master.yml --style=header,grid --force-colorization})
          Dir.chdir(File.dirname('$config'))
          parameter_files = (Array(stack_yml['parameter_files']) +
            [%Q{#{stack}.yml}, File.join(region, %Q{#{stack}.yml}), %Q{#{stack.gsub('-', '_')}.yml}, File.join(region, %Q{#{stack.gsub('-', '_')}.yml})])
            .map { |file| File.join('parameters', file) }
            .select { |file| File.exist?(file) }
          if parameter_files.any?
            system(%Q{bat --style=header,grid --force-colorization #{parameter_files.join(' ')}})
          end\"")"

  if [ -z "$region_and_stack" ]; then
    return
  fi

  if [ -z "$sm_command" ]; then
    sm_command="$(_stackmaster_commands | fzf --header='Select a stack_master command' --preview='bundle exec stack_master help {}')"

    if [ -z "$sm_command" ]; then
      return
    fi
  fi

  local profile_query="$(_stackmaster_account "$config")"
  profile_query="${profile_query#envato-}"
  profile_query="${profile_query%-account}"
  profile_query="${profile_query//-/}"
  local aws_profile
  aws_profile="$(_aws_profiles | \
    fzf --header="Select an AWS profile" \
        --query="$profile_query" \
        --preview="awk -v PREVIEW='{}' '
          \$1 == \"[profile\" && \$2 == PREVIEW \"]\" { printing = 1 }
          \$1 == \"[profile\" && \$2 != PREVIEW \"]\" { printing = 0 }
          printing { print }
        ' ~/.aws/config | bat -fl ini --file-name=~/.aws/config --style=header,grid"
  )"

  if [ -z "$aws_profile" ]; then
    return
  fi

  # local config_arg=''
  # if [ "$config" != './stack_master.yml' ]; then
  #   config_arg="-c '$config' "
  # fi
  local command="aws-vault exec $aws_profile -- \\
  bundle exec stack_master $sm_command $region_and_stack"
  echo "$command" | bat --style=grid --force-colorization
  echo -n "Run command? [y/N] "
  read -r input
  case "$input" in
    [yY][eE][sS]|[yY])
      if [ "$config" != './stack_master.yml' ]; then
        cd "$config"
      fi
      eval "$command"
      ;;
  esac
}
