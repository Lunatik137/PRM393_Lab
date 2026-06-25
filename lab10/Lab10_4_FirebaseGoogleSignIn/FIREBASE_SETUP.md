# Firebase Setup Instructions

To run this project with Firebase Google Sign-In, you must complete the following steps:

## 1. Create a Firebase Project
1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Create a new project.
3. Enable **Authentication** and choose **Google** as a sign-in provider.

## 2. Register Your Android App
1. Add an Android app to your Firebase project.
2. The package name should match the one in your `android/app/build.gradle.kts` (e.g., `com.example.lab10`).
3. You **MUST** provide the **SHA-1** fingerprint for Google Sign-In to work.

### How to get the SHA-1 key:
Run the following command in your terminal:
```bash
cd android
./gradlew signingReport
```
Look for the `SHA1` under the `debug` variant and paste it into the Firebase Console.

## 3. Download google-services.json
1. Download the `google-services.json` file from Firebase.
2. Place it in the `android/app/` directory of this Flutter project.

## 4. Run the App
After placing the `google-services.json` file, you can run the app:
```bash
flutter run
```
