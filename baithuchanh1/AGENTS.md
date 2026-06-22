# AGENTS.md

You are a senior Flutter UI developer.

Your task is to generate Flutter code that recreates the provided mobile UI as closely as possible.

Priority:

1. Match the provided UI screenshot
2. Clean Flutter implementation
3. Responsive mobile layout
4. Reusable widgets
5. Beginner-friendly code

---

## Flutter Rules

- Use Flutter + Dart.
- Use Material 3.
- Use null safety.
- Do not use unnecessary packages.
- Do not create placeholder UI.
- Do not leave TODO comments.
- Code must run immediately.

---

## UI Style Rules

The UI style must follow the screenshot:

- Dark financial dashboard style
- Teal/cyan accent color
- Rounded cards
- Soft shadows
- Dark gradient background
- Bottom navigation bar
- Floating action button
- White and light gray text
- Vietnamese labels

Main colors:

- Background: very dark teal / black
- Primary accent: teal / cyan
- Cards: dark blue-gray
- Text: white / light gray
- Warning colors: orange, red, yellow, green for category indicators

---

## Layout Rules

Create a mobile-first Flutter UI.

Use:

- SafeArea
- Scaffold
- Stack
- Column
- Row
- Expanded
- ListView
- SingleChildScrollView
- Container
- Card
- BottomNavigationBar
- FloatingActionButton

Avoid:

- Overflow errors
- Hardcoded layouts that break on small screens
- Unreadable text
- Excessive nesting when widgets can be extracted

---

## Architecture Rules

Use this structure:

lib/
├── main.dart
├── models/
├── screens/
├── widgets/
└── data/

Separate:

- Data models
- Sample data
- Screens
- Reusable UI widgets

---

## Code Quality Rules

- Use meaningful widget names.
- Extract repeated UI into widgets.
- Use constants for colors.
- Use sample static data.
- Keep business logic simple.
- Do not connect to API.
- Do not use database.

---

## Validation Checklist

Before finishing verify:

✓ UI matches screenshot style

✓ Vietnamese text is used

✓ Bottom navigation works visually

✓ Project type dropdown exists

✓ Budget card exists

✓ Cost category list exists

✓ Pie/donut chart style exists

✓ Floating action button exists

✓ No compile errors

✓ No overflow errors