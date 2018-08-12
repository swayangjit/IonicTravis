#!/bin/bash

if $UPLOAD_TO_CRASHLYTICS ; then
	cd platforms/android 
    	./gradlew  crashlyticsUploadDistributionDevRelease
fi
