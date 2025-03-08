// android/build.gradle

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Android Gradle Plugin sürümü
        classpath("com.android.tools.build:gradle:7.0.4")
        // Google Services Gradle Plugin (Firebase)
        classpath("com.google.gms:google-services:4.4.2")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
