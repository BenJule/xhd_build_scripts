#!/bin/bash
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

# Directory that contains CM build scripts
BUILD_SCRIPT_DIR=~/workspace/XenonHD

## END EDIT ##

cd $BUILD_SCRIPT_DIR

if [ ! -e ./repo_sync_lt01wifi ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./build_fix_lt01wifi ]; then
  echo "Build Fix script is not found"
  exit
fi


if [ ! -e ./start_build_lt01wifi ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_lt01wifi ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_lt01wifi ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Syncing Repos."
echo ""
./repo_sync_lt01wifi
echo ""
echo "Patching Build Fix"
echo ""
./build_fix_lt01wifi
echo ""
echo "Creating Changelog."
echo ""
./make_changelog_lt01wifi
echo ""
echo "Building ROM."
echo ""
./start_build_lt01wifi
echo ""
echo "Copy Rom to Web Server."
echo ""
./update_web_lt01wifi
