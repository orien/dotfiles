
_aws_profiles() {
  grep '^\[profile' ~/.aws/config | \
    cut -d' ' -f2 | \
    tr -d ']'
}

_stackmaster_stacks() {
  ruby -r yaml << RUBY
    YAML.load_file("stack_master.yml")["stacks"].each do |region, stacks|
      stacks.each do |s, _|
        puts("#{region} #{s}")
      end
    end
RUBY
}

_stackmaster_default_account() {
  ruby -r yaml << RUBY
    puts(
      Array(
        YAML.load_file("stack_master.yml")
            .dig("stack_defaults", "allowed_accounts")
      ).first
    )
RUBY
}

_stackmaster_commands() {
  local commands=(apply outputs validate diff compile events resources list lint nag status tidy delete drift)
  printf '%s\n' "${commands[@]}"
}

sm() {
  local sm_command="${1:-}"
  if ! [ -f stack_master.yml ]; then
    echo "stack_master.yml not found"
    return
  fi

  local region_and_stack
  region_and_stack="$(_stackmaster_stacks | \
    fzf --header="Select stack" \
        --preview 'ruby -r yaml -e "region, stack = {}.split(\" \", 2)
          stack_yml = YAML.load_file(\"stack_master.yml\").dig(\"stacks\", region, stack)
          system(\"echo \\\"#{YAML.dump({stack => stack_yml})}\\\" | bat --file-name=stack_master.yml --style=header,grid --force-colorization\")
          parameter_files = Array(stack_yml[\"parameter_files\"])
            .map { |file| File.join(\"parameters\", file) }
            .select { |file| File.exist?(file) }
          if parameter_files.any?
            system(\"bat --style=header,grid --force-colorization #{parameter_files.join(\" \")}\")
          end"')"

  if [ -z "$region_and_stack" ]; then
    return
  fi

  if [ -z "$sm_command" ]; then
    sm_command="$(_stackmaster_commands | fzf --header "Select stack_master command")"

    if [ -z "$sm_command" ]; then
      return
    fi
  fi

  local aws_profile
  aws_profile="$(_aws_profiles | fzf --header "Select AWS profile" --query="$(_stackmaster_default_account) ")"

  if [ -z "$aws_profile" ]; then
    return
  fi

  local command
  command="aws-vault exec $aws_profile -- \\
  bundle exec stack_master $sm_command $region_and_stack"
  echo "$command" | bat --style=grid --force-colorization
  echo -n "Run command? [y/N] "
  read -r input
  case "$input" in
    [yY][eE][sS]|[yY])
      eval "$command"
      ;;
  esac
}
