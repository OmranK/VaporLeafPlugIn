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

# Create plug-ins directory if it doesn't exist
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
if [ ! -d "$plugins_dir" ]; then
    mkdir $plugins_dir
fi

# Copy the IDE Plugin to the plug-ins directory
cp -r Leaf.ideplugin $plugins_dir

# Copy the language specification to the specs directory
spec_dir=/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications

cp Leaf.xclangspec $spec_dir

# Copy the source code language plist to the metadata directory
metadata_dir=/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata

cp Xcode.SourceCodeLanguage.Leaf.plist $metadata_dir

echo "Xcode language support for Vapor Leaf is now ready. Restart Xcode and click "Load bundle" when prompted."
