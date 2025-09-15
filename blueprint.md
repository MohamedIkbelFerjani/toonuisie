# App Name: CleanTunisia

## Purpose:
An app to encourage Gen Z Tunisians (and all citizens) to clean public spaces, starting with tourist areas. The country map is divided into squares, and users can claim, clean, and mark them green to show progress. The app is gamified to make cleaning fun, social, and rewarding.

## 🔑 Core Features (High-Level):

*   **Onboarding & Auth**: Simple welcome and social/phone sign-up.
*   **Map-based Cleaning**: A grid overlay on a map of Tunisia showing clean, dirty, and in-progress areas.
*   **Gamification**: Points, badges, and leaderboards to motivate users.
*   **Social Collaboration**: Users can team up for cleanups.
*   **Proof of Work**: Before/after photos to verify cleanups.
*   **Profile & Sharing**: Personal stats and social media integration.

---

## 💡 Implementation Progress

### V1 (Current Implementation)

*   **Project Setup**: Standard Flutter project initialized.
*   **Navigation**: Implemented declarative routing using the `go_router` package. An `OnboardingScreen` is the initial route, leading to the main `HomeScreen`.
*   **Data Models**:
    *   Created a `CleanupReport` data model (`lib/models/cleanup_report.dart`) to structure the data for cleanup submissions.
*   **UI Shell & Screens**:
    *   Established the main application shell with a persistent `BottomNavigationBar` for primary navigation.
    *   Created placeholder screens for `Leaderboard`, `Events`, `Rewards`, and `Profile`, all accessible via the navigation bar.
*   **Home Screen (Map Functionality)**:
    *   Integrated the `google_maps_flutter` package.
    *   **Action Required**: The user must provide their own Google Maps API key for both Android (`AndroidManifest.xml`) and iOS (`AppDelegate.swift`) to enable map functionality.
    *   The map is initially centered on Tunisia and includes three hardcoded `Marker` examples (Tunis, Sousse, Sfax).
*   **Report a Cleanup Feature**:
    *   A `FloatingActionButton` on the `HomeScreen` navigates users to the `ReportCleanupScreen`.
    *   This screen contains a form with a description field and an image picker button that uses the `image_picker` package to capture a photo from the camera.
    *   The "Submit" button is now functional: it creates a `CleanupReport` object, logs the report details to the debug console using `dart:developer`, navigates the user back to the home screen, and displays a confirmation `SnackBar`.

---

## 🏗️ App Structure (Files Created)

*   `lib/main.dart`: Main application entry point and `go_router` configuration.
*   `lib/models/cleanup_report.dart`: Data model for a cleanup report.
*   `lib/screens/onboarding_screen.dart`: The initial welcome screen.
*   `lib/screens/home_screen.dart`: The main screen featuring the map.
*   `lib/screens/leaderboard_screen.dart`: Screen for the leaderboard feature.
*   `lib/screens/events_screen.dart`: Screen for the events feature.
*   `lib/screens/rewards_screen.dart`: Screen for the rewards feature.
*   `lib/screens/profile_screen.dart`: Screen for the user profile.
*   `lib/screens/report_cleanup_screen.dart`: Screen for users to report a new cleanup.
*   `lib/screens/square_details_screen.dart`: (Placeholder)
*   `lib/screens/volunteer_list_screen.dart`: (Placeholder)
*   `lib/screens/cleanup_proof_screen.dart`: (Placeholder)

---

## 🚀 Next Steps

*   **Backend Integration**: Implement backend logic (e.g., using Firebase) for submitting, storing, and retrieving cleanup reports.
*   **Dynamic Data**: Replace hardcoded map markers with dynamic data fetched from the backend.
*   **Feature Development**: Flesh out the functionality for the Leaderboard, Events, Rewards, and Profile screens.
*   **UI/UX Refinement**: Improve the visual design and user experience of all implemented screens.
