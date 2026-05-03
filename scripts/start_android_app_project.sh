#!/bin/bash

# Configuration

read -p "Project name:" PROJECT_NAME
read -p "Org path: " ORG_ID
PROJECT_NAME="WardrobeSimulator"
ORG_ID="tec.solv"
PACKAGE_NAME="${ORG_ID}.${PROJECT_NAME}"
API_LEVEL=34
BUILD_TOOLS_VERSION="${API_LEVEL}.0.0"
JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64" # Adjust if your path is different

echo "🚀 Creating Android CLI Project: ${PROJECT_NAME}"

# 1. Define Paths
CURRENT_DIR="$(pwd)"
PROJECT_DIR="${CURRENT_DIR}/${PROJECT_NAME}"
SDK_DIR="${HOME}/Android/Sdk" # Adjust if your SDK is elsewhere

# 2. Create Directory Structure
echo "📂 Creating project structure..."
mkdir -p "${PROJECT_DIR}"
cd "${PROJECT_DIR}" || exit

# Create standard folders
mkdir -p app/src/main/java/${PACKAGE_NAME}
mkdir -p app/src/main/res/layout
mkdir -p app/src/main/res/values
mkdir -p app/src/main/res/mipmap-hdpi
mkdir -p app/src/main/res/mipmap-mdpi
mkdir -p app/src/main/res/mipmap-xhdpi
mkdir -p app/src/main/res/mipmap-xxhdpi
mkdir -p app/src/main/res/mipmap-xxxhdpi
mkdir -p app/proguard-rules

# 3. Create Gradle Wrapper and Properties
echo "🔧 Initializing Gradle Wrapper..."
# Download wrapper properties
mkdir -p gradle/wrapper
cat >gradle/wrapper/gradle-wrapper.properties <<EOF
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-bin.zip
networkTimeout=10000
validateDistributionUrl=true
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF

# 4. Create Configuration Files
echo "📝 Creating configuration files..."

# root build.gradle
cat >build.gradle <<EOF
// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id 'com.android.application' version '8.1.0' apply false
}

task clean(type: Delete) {
    delete rootProject.buildDir
}
EOF

# settings.gradle
cat >settings.gradle <<EOF
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "${PROJECT_NAME}"
include ':app'
EOF

# gradle.properties
cat >gradle.properties <<EOF
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.nonTransitiveRClass=true
org.gradle.java.home=${JAVA_HOME}
EOF

# local.properties
# Ensure SDK_DIR points to your actual SDK location
echo "sdk.dir=${SDK_DIR}" >local.properties

# app build.gradle
cat >app/build.gradle <<EOF
plugins {
    id 'com.android.application'
}

android {
    namespace '${PACKAGE_NAME}'
    compileSdk ${API_LEVEL}

    defaultConfig {
        applicationId "${PACKAGE_NAME}"
        minSdk 24
        targetSdk ${API_LEVEL}
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    buildFeatures {
        viewBinding true
    }
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.9.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
}
EOF

# 5. Create Resource Files
echo "🎨 Creating resources..."

# strings.xml
cat >app/src/main/res/values/strings.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">${PROJECT_NAME}</string>
</resources>
EOF

# styles.xml
cat >app/src/main/res/values/styles.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="Theme.${PROJECT_NAME}" parent="Theme.MaterialComponents.DayNight.DarkActionBar">
        <!-- Primary brand color. -->
        <item name="colorPrimary">#6200EE</item>
        <item name="colorPrimaryVariant">#3700B3</item>
        <item name="colorOnPrimary">@android:color/white</item>
        <!-- Secondary brand color. -->
        <item name="colorSecondary">#03DAC6</item>
        <item name="colorSecondaryVariant">#018786</item>
        <item name="colorOnSecondary">@android:color/black</item>
        <!-- Status bar color. -->
        <item name="android:statusBarColor">?attr/colorPrimaryVariant</item>
    </style>
</resources>
EOF

# activity_main.xml
cat >app/src/main/res/layout/activity_main.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout 
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:gravity="center"
    android:padding="16dp">

    <TextView
        android:id="@+id/text_main"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/app_name"
        android:textSize="24sp"
        android:textStyle="bold"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
EOF

# AndroidManifest.xml
cat >app/src/main/AndroidManifest.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.${PROJECT_NAME}">
        
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
EOF

# MainActivity.java
cat >app/src/main/java/${PACKAGE_NAME}/MainActivity.java <<EOF
package ${PACKAGE_NAME};

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    
    TextView textView = findViewById(R.id.text_main);
    textView.setText("Hello, World!");
  }
}
EOF

# proguard-rules.pro (Empty)
touch app/proguard-rules.pro

# 6. Create Dummy Icons (1x1 transparent PNG)
# Using base64 to embed a small transparent PNG directly into the script
echo "🖼️ Creating dummy icons..."

# Create a simple 48x48 transparent PNG (Base64 string of a tiny PNG)
ICON_DATA="iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
echo "$ICON_DATA" | base64 -d >app/src/main/res/mipmap-hdpi/ic_launcher.png
echo "$ICON_DATA" | base64 -d >app/src/main/res/mipmap-hdpi/ic_launcher_round.png
cp app/src/main/res/mipmap-hdpi/ic_launcher.png app/src/main/res/mipmap-mdpi/ic_launcher.png
cp app/src/main/res/mipmap-hdpi/ic_launcher.png app/src/main/res/mipmap-xhdpi/ic_launcher.png
cp app/src/main/res/mipmap-hdpi/ic_launcher.png app/src/main/res/mipmap-xxhdpi/ic_launcher.png
cp app/src/main/res/mipmap-hdpi/ic_launcher.png app/src/main/res/mipmap-xxxhdpi/ic_launcher.png
cp app/src/main/res/mipmap-hdpi/ic_launcher_round.png app/src/main/res/mipmap-mdpi/ic_launcher_round.png
cp app/src/main/res/mipmap-hdpi/ic_launcher_round.png app/src/main/res/mipmap-xhdpi/ic_launcher_round.png
cp app/src/main/res/mipmap-hdpi/ic_launcher_round.png app/src/main/res/mipmap-xxhdpi/ic_launcher_round.png
cp app/src/main/res/mipmap-hdpi/ic_launcher_round.png app/src/main/res/mipmap-xxxhdpi/ic_launcher_round.png

echo "✅ Project Structure Complete!"
echo "📍 Location: ${PROJECT_DIR}"
echo ""
echo "Next Steps:"
echo "1. Install SDK Components (if not already done):"
echo "   sdkmanager 'platform-tools' 'platforms;android-${API_LEVEL}' 'build-tools;${BUILD_TOOLS_VERSION}'"
echo ""
echo "2. Generate Wrapper (if not done):"
echo "   cd ${PROJECT_DIR}"
echo "   gradle wrapper --gradle-version=8.4"
echo ""
echo "3. Build:"
echo "   ./gradlew build"
