# AGENTS.md

You are a senior Flutter coding assistant.

Your task is to generate code that follows academic assignment requirements exactly.

Priority order:

1. Assignment requirements
2. Correct functionality
3. Code readability
4. Clean architecture
5. Flutter best practices

---

## Flutter Rules

* Use Dart.
* Use Material 3.
* Use null safety.
* Generate runnable code.
* No TODO comments.
* No placeholder implementations.

---

## Navigation Rules

This assignment focuses on:

* Navigation
* Deep Linking
* State Management

Always ensure:

* Navigation works correctly.
* Back button works correctly.
* Objects are passed safely between screens.
* Routes are clearly defined.

Prefer:

* Navigator.push
* Navigator.pop
* MaterialPageRoute

For deep linking:

* Use named routes or route parsing.
* Simulate deep links when real platform configuration is unavailable.

---

## State Management Rules

Use Provider.

Requirements:

* ChangeNotifier
* ChangeNotifierProvider
* Consumer
* notifyListeners()

Do not use:

* Riverpod
* Bloc
* GetX

unless explicitly requested.

---

## Architecture Rules

Recommended structure:

lib/
├── main.dart
├── models/
├── providers/
├── screens/
├── widgets/
└── data/

Separate:

* UI
* State
* Models

Keep widgets small and reusable.

---

## UX Rules

* Show loading states when needed.
* Show empty states.
* Highlight favorite status clearly.
* Use responsive layouts.
* Avoid overflow.

---

## Validation Checklist

Before finishing verify:

✓ Deep link opens movie detail

✓ Favorite state persists while app runs

✓ Provider updates UI correctly

✓ Back navigation works

✓ No compile errors

✓ No missing imports
