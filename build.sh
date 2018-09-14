#!/bin/bash

# Simple script to clean install
rm -rf node_modules
rm -rf platforms
rm -rf plugins
rm -rf www

NPM_COUNTER=0
CORDOVA_COUNTER=0
SUNBIRD_CORDOVA_COUNTER=0

# NPM[0]=""
# CORDOVA[0]=""
# Pass build branch as input
buildBranch="$1"

file="./build_config"
while IFS="=" read -r key value; do
  case "$key" in
    '#'*) ;;
    'npm'*)
      NPM[$NPM_COUNTER]=$value
      NPM_COUNTER=`expr $NPM_COUNTER + 1`;;
    'cordova'*)
      CORDOVA[$CORDOVA_COUNTER]=$value
      CORDOVA_COUNTER=`expr $CORDOVA_COUNTER + 1`;;
    
  esac
done < "$file"

npm i @ionic/app-scripts
npm install
cd cordova-plugin
ionic cordova plugin add $TRAVIS_BUILD_DIR/cordova-plugin/cordova-plugin-crashlytics
cd ..

#for cordova_plugin in "${CORDOVA[@]}"
#do
#  ionic cordova plugin add $cordova_plugin
#done


buildBranch="$1"


rm -rf platforms


ionic cordova platforms add android



ionic cordova build android --prod --release --buildConfig ./config/build.json

ls src/assets

