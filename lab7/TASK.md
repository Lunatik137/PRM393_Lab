# TASK.md

Project:
Lab 7 – Building a Signup Form with Validation & Good UX

Requirements:

Build a signup screen with:

1. Full Name
2. Email
3. Password
4. Confirm Password

Validation:

* All fields required.
* Email must contain @ and .
* Password:

    * Minimum 8 characters
    * At least 1 digit
* Confirm Password must match Password.

UX Requirements:

* Inline validation errors.
* Success SnackBar.
* Prevent invalid submission.
* Loading state during async validation.

Focus Management:

* Full Name → Email → Password → Confirm Password.
* Use FocusNode.
* Use TextInputAction.next.
* Use TextInputAction.done.

Keyboard:

* Tap outside to dismiss.
* Prevent overflow using ListView or SingleChildScrollView.

Async Validation:

* Simulate server validation using Future.delayed.
* If email starts with "taken":

    * Show error message.
* Otherwise:

    * Registration successful.

Bonus Features:

* Show/Hide Password.
* Show/Hide Confirm Password.
* Terms & Conditions checkbox.
* Password Strength Indicator.
* Loading indicator in submit button.

Technical Constraints:

* Single main.dart file.
* Flutter only.
* Dart only.
* No third-party packages.
* Must run in DartPad.

Acceptance Criteria:

✓ Required field validation

✓ Email validation

✓ Password validation

✓ Confirm password validation

✓ Focus management

✓ Keyboard dismissal

✓ Async validation

✓ Success feedback

✓ No compile errors
