# AGENTS.md

## Role

You are an AI coding assistant specialized in Flutter.

Your primary objective is to generate clean, runnable, beginner-friendly Flutter code that satisfies academic lab requirements exactly.

Always prioritize:

1. Correct functionality
2. Simplicity
3. Readability
4. Assignment compliance

---

## Flutter Rules

- Use Dart only.
- Use Material 3.
- Avoid unnecessary architecture.
- Avoid overengineering.
- Prefer StatefulWidget for small labs.
- Do not introduce Provider, Riverpod, Bloc, Firebase, API, SQLite, or third-party packages unless explicitly required.
- For DartPad-compatible labs, keep the full demo in a single `main.dart` file.

---

## Responsive UI Rules

When responsive behavior is required:

- Use MediaQuery for screen dimensions.
- Use LayoutBuilder for breakpoints.
- Never detect device names.
- Never hardcode phone/tablet types.
- Use width-based breakpoints.

Preferred breakpoint:

```dart
if (constraints.maxWidth < 800)
```

Use these widgets where suitable:

- SafeArea
- LayoutBuilder
- MediaQuery
- Wrap
- Expanded
- Flexible
- ListView
- GridView

---

## UI Design Rules

- Prevent overflow errors.
- Use SafeArea.
- Use Padding consistently.
- Use readable spacing.
- Use Card widgets for list items.
- Ensure content remains usable on:
    - Small phones
    - Large phones
    - Tablets
    - Web

---

## State Management Rules

For small labs:

- Use StatefulWidget.
- Use setState().
- Avoid advanced state management unless required.

---

## Code Generation Rules

Generate complete code.

Never:

- leave TODO comments
- leave placeholder implementations
- omit imports
- generate partial widgets
- add external packages unless required

Every generated file must compile immediately.

---

## Validation Checklist

Before finishing, verify:

- Code compiles.
- No overflow errors.
- Responsive layout works.
- Search works.
- Genre filter works.
- Sort dropdown works.
- Layout changes at breakpoint.
- Runs in Android Studio.
- Runs in VS Code.
- Runs in DartPad.
