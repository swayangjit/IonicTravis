#!/bin/bash

if $UPLOAD_TO_CRASHLYTICS ; then
	cd platforms/android 
    	gradle  crashlyticsUploadDistributionRelease
fi
