# music_taks

## Overview
This Flutter project implements a single screen for the S.Rocks.Music app as per the assignment brief. It uses MVVM architecture, Provider for state management, and Firebase Firestore for data fetching.

## Folder Structure
- `lib/models/`: Contains the `Service` model.
- `lib/repositories/`: Handles Firestore data fetching (`ServiceRepository`).
- `lib/viewmodels/`: Manages state with `HomeViewModel`.
- `lib/views/`: UI screens (`HomeScreen`, `DetailScreen`).
- `lib/main.dart`: App entry point with Firebase initialization.

## Approach
- Used `Provider` for state management to handle the list of services fetched from Firestore.
- Implemented MVVM by separating concerns: `ServiceRepository` for data, `HomeViewModel` for logic, and `HomeScreen` for UI.
- Added navigation to a detail screen when a service card is tapped.
- Made the UI responsive using `MediaQuery` and proper padding/margins.
- Fetched data dynamically from Firestore and displayed it in cards with background illustrations.

## Setup
1. Clone the repo.
2. Run `flutter pub get` to install dependencies.
3. Set up Firebase and add your `google-services.json` or `GoogleService-Info.plist`.
4. Add service data to Firestore in a `services` collection.
5. Run the app with `flutter run`.

## Screen Recording
[https://drive.google.com/file/d/1T2TJQ0vVRMBcNn-imtlEbgOsViJfMqTt/view?usp=sharing]
