#!/bin/bash
echo $RELEASE_CANDIDATE
echo $TRAVIS_BRANCH
if [ "$RELEASE_CANDIDATE" == "$TRAVIS_BRANCH" ]; then 
cd platforms/android 
cp ../../config/fabric.properties app/
./gradlew  crashlyticsUploadDistributionDevRelease
fi

