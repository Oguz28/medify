// android/build.gradle.kts
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Android Gradle Plugin sürümü
        classpath("com.android.tools.build:gradle:8.13")
        // Google Services Gradle Plugin (Firebase için)
        classpath("com.google.gms:google-services:4.4.2")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// (İsteğe bağlı) Temizlik görevleri vb. ekleyebilirsiniz.
