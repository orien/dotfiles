#!/bin/bash
set -eu

# Dock
# ====

# Position the dock on the left of the screen
defaults write com.apple.Dock orientation -string 'left'

# Reduce the size of icons in the dock
defaults write com.apple.Dock tilesize -int '36'

# Remove all the pinned icons
defaults write com.apple.Dock persistent-apps -array '()'

# Automatically hide the dock
defaults write com.apple.Dock autohide -bool 'TRUE'

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float '0'

# Modify timing of the auto-hide Dock animation
defaults write com.apple.Dock autohide-time-modifier -float '0.3'

# Dims the dock icons for apps that are hidden
defaults write com.apple.Dock showhidden -bool 'TRUE'

# Hide indicator lights under running applications
defaults write com.apple.Dock show-process-indicators -bool 'FALSE'

killall Dock

# Finder
# ======

# Show status bar
defaults write com.apple.Finder ShowStatusBar -bool 'TRUE'

# Show path bar
defaults write com.apple.Finder ShowPathBar -bool 'TRUE'

# Use list view in all Finder windows by default
defaults write com.apple.Finder FXPreferredViewStyle -string 'Nlsv'

# Disable the warning before emptying the Trash
defaults write com.apple.Finder WarnOnEmptyTrash -bool 'FALSE'

# Display full POSIX path in Finder Window
defaults write com.apple.Finder _FXShowPosixPathInTitle -bool 'TRUE'

# Disable file extension change warnings
defaults write com.apple.Finder FXEnableExtensionChangeWarning -bool 'FALSE'

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool 'TRUE'

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool 'TRUE'

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool 'TRUE'

# Show Library directory
if ls -Old "$HOME/Library" | grep -q hidden ; then
  chflags nohidden "$HOME/Library"
fi

killall Finder

# Menu Bar
# ========

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -bool 'TRUE'

killall SystemUIServer

# Misc
# ====

# Disable reopen windows when logging back in
defaults write com.apple.loginwindow TALLogoutSavesState -bool 'FALSE'

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int '3'

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float '0.001'

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int '2'

