#!/bin/bash
# Script to install/update Chromium from continuous builds
echo "Creating temporary directories"
mkdir /tmp/chromedownload && cd /tmp/chromedownload
echo "Getting ID for latest build"
curl http://commondatastorage.googleapis.com/chromium-browser-continuous/Mac/LAST_CHANGE -o /tmp/chromedownload/LATEST && LATEST=`cat /tmp/chromedownload/LATEST`
echo "Downloading OS X build $LATEST"
curl http://commondatastorage.googleapis.com/chromium-browser-continuous/Mac/$LATEST/chrome-mac.zip -o /tmp/chromedownload/chrome-mac.zip
echo "Unzipping..."
unzip -qq /tmp/chromedownload/chrome-mac.zip
echo "Replacing previous Chromium app"
cp -R /tmp/chromedownload/chrome-mac/Chromium.app /Applications
echo "Cleaning up temporary files"
rm -rf /tmp/chromedownload
echo "Done"
