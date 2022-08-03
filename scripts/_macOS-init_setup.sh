#!/usr/bin/env bash

# Mostly stolen from https://github.com/mdo/config/blob/7739ea9064e4e7ec1a5b2efe32f54bace8253fe1/config.sh#L119

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# Clear out the dock of default icons
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

downloadfolder="$HOME/Downloads"
defaults write com.apple.dock persistent-others -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$downloadfolder</string><key>_CFURLStringType</key><integer>0</integer></dict><key>file-label</key><string>Downloads</string><key>file-type</key><string>2</string></dict><key>tile-type</key><string>directory-tile</string></dict>"

# Don’t show recent applications in Dock
 defaults write com.apple.dock show-recents -bool false

 # Don't rearrange spaces
 defaults write com.apple.dock mru-spaces -bool false

# Show path bar
 defaults write com.apple.finder ShowPathbar -bool true
# Finder: show status bar
 defaults write com.apple.finder ShowStatusBar -bool true

# Hot corner: Bottom right, put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

# Bottom left: start screensaver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# ctrl+scroll for zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
