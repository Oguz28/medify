// android/app/build.gradle

apply plugin: 'com.android.application'
apply plugin: 'com.google.gms.google-services' // Google Services Plugin'in eklenmesi

android {
    compileSdkVersion 33

    defaultConfig {
        applicationId "com.app.medify"
        minSdkVersion 21
        targetSdkVersion 33
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            // Eğer release imzalama yapılandırmanız varsa, buraya ekleyin
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib:1.7.20"

    // Firebase BoM (Bill of Materials) ile tüm Firebase bağımlılıklarının uyumlu sürümünü yönetiyoruz
    implementation platform("com.google.firebase:firebase-bom:33.10.0")
    
    // Örneğin Firebase Analytics ve Firestore kullanımı
    implementation "com.google.firebase:firebase-analytics"
    implementation "com.google.firebase:firebase-firestore"
    
    // Diğer bağımlılıklarınız...
}
