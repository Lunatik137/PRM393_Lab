# TASK.md

Project:
Movie App – Navigation & State Management

## Objective

Build a small Movie App demonstrating:

1. Deep Linking
2. Provider State Management
3. Navigation

---

## Movie Model

Create Movie model:

* id
* title
* posterUrl
* overview
* genres
* rating

---

## Sample Data

Create at least 5 sample movies.

Use local static data.

No API calls.

---

## Screens

### Home Screen

Display movie list.

Each item shows:

* Poster
* Title
* Rating

Tap movie:

Navigate to Movie Detail Screen.

---

### Movie Detail Screen

Display:

* Poster Banner
* Title
* Genres
* Overview
* Favorite Button

Allow:

Add/Remove Favorite

---

### Favorite Screen

Display all favorite movies.

Show empty state when no favorites exist.

---

## Navigation

Required:

Home Screen
↔ Movie Detail Screen

Home Screen
↔ Favorite Screen

Back button must work correctly.

---

## Provider State

Create FavoriteMoviesProvider.

Features:

* Add favorite
* Remove favorite
* Check favorite status
* Notify listeners

Use:

* ChangeNotifier
* ChangeNotifierProvider
* Consumer

---

## Deep Linking

Implement movie detail deep link.

Example:

movieapp://movie/1

Expected behavior:

Open Movie Detail Screen for Movie ID 1.

If movie does not exist:

Show error screen.

For DartPad compatibility:

Provide a simulated deep link button on Home Screen.

Example:

"Open Movie #1 via Deep Link"

---

## UI Requirements

Use Material 3.

Movie cards should contain:

* Image
* Title
* Rating

Movie detail should contain:

* Hero banner
* Genres chips
* Overview
* Favorite toggle

---

## Acceptance Criteria

✓ Home Screen

✓ Movie Detail Screen

✓ Favorite Screen

✓ Provider implemented

✓ Favorite state updates correctly

✓ Deep link implemented

✓ Back navigation works

✓ No API usage

✓ No compile errors
