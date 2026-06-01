# TASK.md

## Project

Lab 6 – Building a Responsive Movie Genre Browsing Screen

## Objective

Build a responsive movie browsing screen demonstrating:

- MediaQuery
- LayoutBuilder
- Wrap
- Responsive List/Grid Layout
- Search
- Filtering
- Sorting

---

## Technical Constraints

- Flutter only
- Dart only
- No third-party packages
- Single file only: `main.dart`
- Must run in DartPad Flutter mode
- Must run in Android Studio and VS Code

---

## Movie Model

Create a `Movie` class with:

- title
- year
- genres
- posterUrl
- rating

---

## Sample Data

Create 6 sample movies.

Use static data only.

Do not use:

- API calls
- database
- Firebase
- external packages

---

## UI Layout

The screen must include:

1. Hero/header section
2. Title: `Find a Movie`
3. Search bar
4. Genre chips
5. Sort dropdown
6. Responsive movie list

---

## Search Feature

- Search by movie title.
- Case-insensitive.
- Results update immediately while typing.

---

## Genre Filter

Genres:

- Action
- Drama
- Comedy
- Sci-Fi
- Adventure
- Thriller

Requirements:

- Multiple genres can be selected.
- Use `Wrap` for chips.
- Selected chips must have a different appearance.
- If no genre is selected, show all movies.
- If one or more genres are selected, show movies that match at least one selected genre.

---

## Sort Options

Dropdown values:

- A-Z
- Z-A
- Year
- Rating

Sorting must update immediately.

---

## Responsive Behavior

### Width < 800

Use:

```dart
ListView.builder
```

Single-column movie list.

### Width >= 800

Use:

```dart
GridView.count
```

Two-column movie layout.

---

## Movie Card

Each movie card must show:

- Poster image using `Image.network`
- Title
- Year
- Rating
- Genres

---

## Bonus Features

Implement if simple:

- Selected genre counter badge
- Clear filters button
- Numeric rating text
- Different card spacing for tablet/web

---

## Acceptance Criteria

- Search works.
- Genre filtering works.
- Sort dropdown works.
- Responsive layout works.
- `Wrap` is used for genre chips.
- `LayoutBuilder` is used for responsive movie layout.
- `SafeArea` is used.
- ListView appears on phone width.
- GridView appears on tablet/web width.
- No package dependencies.
- Single `main.dart` file.
- Code compiles and runs without modification.
