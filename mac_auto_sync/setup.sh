#!/bin/bash

set -e

BASEDIR=$(dirname "$0")
cd $BASEDIR

type fswatch > /dev/null 2>&1 || brew install fswatch

chmod +x auto_commit_push.sh

mkdir -p ~/Library/LaunchAgents
cp com.eriksuen.autosync_dotfiles.plist ~/Library/LaunchAgents

sed -i "" "s;\$PATH;${PATH};g" ~/Library/LaunchAgents/com.eriksuen.autosync_dotfiles.plist

launchctl unload -w ~/Library/LaunchAgents/com.eriksuen.autosync_dotfiles.plist
launchctl load -w ~/Library/LaunchAgents/com.eriksuen.autosync_dotfiles.plist