# Firebase Setup Instructions for Lab 10.4

## 1. Firebase Console
- Go to [Firebase Console](https://console.firebase.google.com/).
- Create a new project named `prmlab10`.
- Add an Android app with package name `com.prm.lab10`.
- Download `google-services.json` and place it in `android/app/`.

## 2. Authentication
- Enable **Google Sign-In** in the Authentication section of Firebase Console.

## 3. SHA-1 Fingerprint
- You must provide your SHA-1 fingerprint to Firebase.
- Run this in your terminal (inside `android/` folder):
  ```bash
  ./gradlew signingReport
  ```
- Copy the SHA-1 from `debug` and paste it into Firebase project settings for your Android app.

## 4. Android Configuration

### `android/build.gradle` (or `android/settings.gradle.kts`)
Ensure the Google Services plugin is added.

### `android/app/build.gradle` (or `android/app/build.gradle.kts`)
Apply the plugin: `id("com.google.gms.google-services")`
