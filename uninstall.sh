#!/usr/bin/env bash

# Show trace if option -o is used
if [[ $1 == "-o" ]]; then
    set -o xtrace
fi

# Warns user to run the script as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root using sudo."
    exit 1
fi

# Remove the IDE Plugin from the plug-ins directory
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
rm -rf $plugins_dir/Leaf.ideplugin

# Remove the language specification from the specs directory
spec_dir=/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications
rm $spec_dir/Leaf.xclangspec

# Remove the source code language plist from the metadata directory
metadata_dir=/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata
rm $metadata_dir/Xcode.SourceCodeLanguage.Leaf.plist

echo "Xcode language support for Vapor Leaf is now uninstalled..."
