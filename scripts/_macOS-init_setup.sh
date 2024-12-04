#!/usr/bin/env bash

# Mostly stolen from https://github.com/mdo/config/blob/7739ea9064e4e7ec1a5b2efe32f54bace8253fe1/config.sh#L119

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# Clear out the dock of default icons
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

# Add downloads to Dock
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

# ctrl+scroll for zoom, these require full disk access
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Require password immediately after screensaveer
defaults write com.apple.screensaver askForPassword -int 0
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Make trackpad go zoooooom
defaults write -g com.apple.trackpad.scaling -int 3


# Setup ^1 through ^9 to switch Desktops
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>18</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"

# ^2
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 119 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>19</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"
# ^3
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 120 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>20</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"

# ^4
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 121 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>21</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"
# ^5
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 122 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>23</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"

# ^6 
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 123 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>22</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"
# ^7
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 124 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>26</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"


# ^8
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 125 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>28</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"

# ^9 
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 126 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>25</integer>
        <integer>262144</integer>
      </array>
    </dict>
  </dict>
"

# Restart the deamon make above work
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# Setup Seqouia moom-like config
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Move & Resize\033Top" "@^$\\U2191"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Move & Resize\033Right" "@^$\\U2192"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Move & Resize\033Left" "@^$\\U2190"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Move & Resize\033Bottom" "@^$\\U2193"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Fill" "@^$ "
defaults write com.apple.WindowManager EnableTiledWindowMargins 0

# Caps Lock -> Control on the built-in keyboard
keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"

# Hardocding vendor/device for Sculpt (caps lock, swap alt with control):
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1118-1957-0 -array "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771299</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771298</integer>\
</dict>
"  "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"  "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771303</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771302</integer>\
</dict>
"  "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771298</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771299</integer>\
</dict>
"  "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771302</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771303</integer>\
</dict>
"

killall Finder
killall Dock

if ! command -v brew 2>&1 >/dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle install
fi
