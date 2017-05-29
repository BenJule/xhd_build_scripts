#!/bin/bash
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

# Directory that contains CM build scripts
BUILD_SCRIPT_DIR=~/workspace/XenonHD

## END EDIT ##

cd $BUILD_SCRIPT_DIR

if [ ! -e ./repo_sync_i9300 ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./build_fix_i9300 ]; then
  echo "Build fix script is not found"
  exit
fi

if [ ! -e ./start_build_i9300 ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_i9300 ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_i9300 ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Syncing Repos."
echo ""
./repo_sync_i9300
echo ""
echo "Patching Build fix"
echo ""
./build_fix_i9300
echo ""
echo "Creating Changelog."
echo ""
./make_changelog_i9300
echo ""
echo "Building ROM."
echo ""
./start_build_i9300
echo ""
echo "Copy Rom to Web Server."
echo ""
./update_web_i9300
./xenonhd-i9300-upload.sh
