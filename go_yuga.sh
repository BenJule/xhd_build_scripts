#!/bin/bash
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

# Directory that contains CM build scripts
BUILD_SCRIPT_DIR=~/workspace/XenonHD

## END EDIT ##

cd $BUILD_SCRIPT_DIR

if [ ! -e ./repo_sync_yuga ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./build_fix_yuga ]; then
  echo "Build fix script is not found"
  exit
fi

if [ ! -e ./start_build_yuga ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_yuga ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_yuga ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Syncing Repos."
echo ""
./repo_sync_yuga
echo ""
echo "Patching Build fix"
echo ""
./build_fix_yuga
echo ""
echo "Creating Changelog."
echo ""
./make_changelog_yuga
echo ""
echo "Building ROM."
echo ""
./start_build_yuga
echo ""
echo "Copy Rom to Web Server."
echo ""
./update_web_yuga
