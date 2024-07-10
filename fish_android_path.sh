#!/bin/sh

export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

echo "ANDROID_HOME set to $ANDROID_HOME"

echo "PATH updated to include Android SDK tools"

