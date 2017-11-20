#!/bin/bash

function update_app_name() {
    echo "Updating app name for $1"
    CURRENT_APP_NAME=`/usr/libexec/PlistBuddy -c "Print :CFBundleName" "$1"`
    NEW_APP_NAME="Preprod - $CURRENT_APP_NAME"
    echo "New app name is '$NEW_APP_NAME'"
    /usr/libexec/PlistBuddy -c "Set :CFBundleName '$NEW_APP_NAME'" "$1"
}

find . -name "Info.plist" -type f | while read info; do update_app_name "$info"; done
