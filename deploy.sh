#!/bin/bash

if [ "$RELEASE_CANDIDATE" == "$TRAVIS_BRANCH" ]; then 
cd platforms/android 
cp ../../config/fabric.properties app/
./gradlew  crashlyticsUploadDistributionDevRelease
fi

