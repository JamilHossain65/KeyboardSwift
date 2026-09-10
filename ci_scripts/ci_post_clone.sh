#!/bin/sh
cd $CI_PRIMARY_REPOSITORY_PATH
export LANG=en_US.UTF-8
sudo gem install cocoapods
pod install

# git command
#chmod +x ci_scripts/ci_post_clone.sh
#git add ci_scripts/ci_post_clone.sh

# Navigate to the repository root directory
#cd ..

# Install CocoaPods dependencies using Homebrew
brew install cocoapods

# Run pod install to resolve and pull your dependencies
pod install
