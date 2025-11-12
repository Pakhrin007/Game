plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // ADD THIS LINE:
    // id("com.google.gms.google-services")
}

android {
    namespace = "com.example.banana"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.banana"
        minSdk = 23 
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// dependencies {
//     // ADD THESE FOR FIREBASE (aligns with Flutter's firebase_core/auth):
//     implementation(platform("com.google.firebase:firebase-bom:33.6.0"))  // Latest BOM as of Nov 2025
//     implementation("com.google.firebase:firebase-auth-ktx")  // For Auth
//     // Add others if needed, e.g., implementation("com.google.firebase:firebase-firestore-ktx")
// }