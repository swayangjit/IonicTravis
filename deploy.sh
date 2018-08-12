#!/bin/bash

if $UPLOAD_TO_CRASHLYTICS ; then
	cd platforms/android 
	cp ../../config/fabric.properties app/
    	./gradlew  crashlyticsUploadDistributionDevRelease
fi
