# TASK.md

Project:
LAB 10 – Authentication, Session Management & Notifications

Important:

Generate SIX separate Flutter projects.

Projects:

1. Lab10_1_MockLogin
2. Lab10_2_RealApiLogin
3. Lab10_3_AutoLogin_Logout
4. Lab10_4_FirebaseGoogleSignIn
5. Lab10_5_Notification
6. Lab10_Full

---

# Lab10_1_MockLogin

Requirements:

* Login Screen
* Email field
* Password field
* Form validation
* Simulated backend login

Implementation:

* Future.delayed()
* Mock token

Success:

Navigate to Home Screen.

Failure:

Show error message.

---

# Lab10_2_RealApiLogin

Requirements:

Use DummyJSON Authentication API.

Endpoint:

https://dummyjson.com/auth/login

Features:

* POST login request
* Parse token
* Loading state
* Error state

Success:

Navigate to Home.

---

# Lab10_3_AutoLogin_Logout

Requirements:

Use SharedPreferences.

Features:

* Save token
* SplashScreen
* Auto-login
* Logout

Behavior:

Token exists
→ Home

Token missing
→ Login

Logout:

Clear token
→ Login

---

# Lab10_4_FirebaseGoogleSignIn

Requirements:

Use:

* firebase_core
* firebase_auth
* google_sign_in

Features:

* Google Sign-In
* User profile display
* Logout

Display:

* Name
* Email
* Photo

---

# Lab10_5_Notification

Requirements:

Use:

flutter_local_notifications

Features:

* Request permission
* Trigger notification
* Manual test button

Android 13 support required.

---

# Lab10_Full

Integrate:

* Real API Login
* SharedPreferences
* SplashScreen
* Google Sign-In
* Logout
* Local Notification

Login Success:

Trigger notification.

Minimum Screens:

* Splash
* Login
* Home
* Profile

---

## Acceptance Criteria

✓ Mock Login

✓ Real API Login

✓ SharedPreferences

✓ Auto Login

✓ Logout

✓ Google Sign-In

✓ Local Notifications

✓ Final Integration

✓ No compile errors
