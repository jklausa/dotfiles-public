#!/usr/bin/env bash

BOOTED_UUID=$(xcrun simctl list devices | grep "(Booted)" | grep -E -o -i "([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})")
PREF_PATH=~/Library/Developer/CoreSimulator/Devices/$BOOTED_UUID/data/Library/Preferences/

# Global settings
GLOBAL_PLIST=$PREF_PATH/.GlobalPreferences.plist
LANGUAGE="[en-US, en-DE]"
KEYBOARDS="[en_US@sw=QWERTY;hw=Automatic, de_DE@sw=QWERTZ-German;hw=Automatic, emoji@sw=Emoji]"

plutil -replace AppleLanguages -json "[ \"$LANGUAGE\" ]" "$GLOBAL_PLIST"
plutil -replace AppleKeyboards -json "[ \"$KEYBOARDS\" ]" "$GLOBAL_PLIST"

# Keyboard settings
KEYBOARD_PLIST=$PREF_PATH/com.apple.keyboard.preferences.plist

plutil -replace HWKeyboardAutocorrection -bool NO "$KEYBOARD_PLIST"

xcrun simctl shutdown "$BOOTED_UUID"
xcrun simctl boot "$BOOTED_UUID"

