package com.ionic;

import android.app.Application;
import android.content.Context;
import com.crashlytics.android.Crashlytics;
import io.fabric.sdk.android.Fabric;



public class IonicApplication extends Application{
    @Override
    public void onCreate() {
        super.onCreate();
        initCrashlytics();

    }

    
   
    private void initCrashlytics(){
        if(getBuildConfigValue(getApplicationInfo().packageName, "USE_CRASHLYTICS")){
            Fabric.with(this, new Crashlytics());
        }
    }

    public static <T> T getBuildConfigValue(String packageName, String property) {
        Class<?> clazz = getBuildConfigClass(packageName);
        if (clazz == null) {
            throw new IllegalStateException("packageName, can not be null or empty.");
        }

        Object value = getStaticFieldValue(clazz, property);
        return (T) value;
    }

    public static Object getStaticFieldValue(Class<?> clazz, String fieldName) {
        try {
            return clazz.getField(fieldName).get(null);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }

        return null;
    }

    private static Class<?> getBuildConfigClass(String packageName) {
        return getClass(packageName + ".BuildConfig");
    }

    public static Class<?> getClass(String className) {
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
