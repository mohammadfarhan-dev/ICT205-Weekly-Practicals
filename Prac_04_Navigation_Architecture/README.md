# ICT205 Practical 4 – Navigation, Routing & App Architecture

## Overview

This practical demonstrates structured navigation, named routes, passing data between screens, and a simple layered Flutter architecture.

The application follows an onboarding-to-dashboard flow. The onboarding screen obtains a user from the data layer and passes the user's name to the dashboard using named route arguments. The dashboard reads the route argument and displays a personalised welcome message.

## Project

Flutter project:

`navigation_lab`

Recommended portfolio folder:

```text
Prac_04_Navigation_Architecture/
├── README.md
├── evidence/
└── navigation_lab/
```

## Practical Requirements Demonstrated

- Stack-based Flutter navigation
- Named routes
- Centralised route configuration
- `Navigator.pushNamed`
- Passing data through route arguments
- Reading route arguments with `ModalRoute.of(context)`
- Onboarding → Dashboard navigation flow
- Back navigation using Flutter's navigation stack
- UI, Domain, and Data layers
- Simple `User` domain model
- Simple `UserService` data layer
- Automated widget testing
- Flutter static analysis

## Application Flow

```text
Onboarding
    ↓
Continue
    ↓
Dashboard
    ↓
Welcome Alice
```

Pressing the back arrow on the Dashboard returns to the Onboarding screen.

## Layered Architecture

The application is separated into three logical layers:

### UI Layer

Contains the application screens and UI widgets.

```text
lib/
└── ui/
    ├── screens/
    │   ├── onboarding_screen.dart
    │   └── dashboard_screen.dart
    └── widgets/
```

### Domain Layer

Contains the application model.

```text
lib/
└── domain/
    └── user.dart
```

The `User` model stores the user's name.

### Data Layer

Contains the data service.

```text
lib/
└── data/
    └── user_service.dart
```

`UserService` returns a `User` named `Alice`.

The data flow is:

```text
UI → UserService → User
```

The onboarding screen gets the user from `UserService`, then passes `user.name` to the Dashboard through the named route.

## Named Routes

The application centralises navigation in `MaterialApp`:

```text
/            → OnboardingScreen
/dashboard   → DashboardScreen
```

The onboarding screen navigates with `Navigator.pushNamed` and passes the selected user's name as the route argument.

The dashboard retrieves the value from `ModalRoute.of(context)?.settings.arguments`.

## Testing

The project was formatted and checked using:

```bash
dart format lib test
flutter analyze
flutter test
```

Final results:

```text
No issues found!
All tests passed!
```

The automated widget tests verify:

- The Onboarding screen is displayed.
- The Continue button is visible.
- Tapping Continue navigates to the Dashboard.
- The Dashboard displays `Welcome Alice`.

## Evidence

The `evidence` folder contains:

1. `01 Flutter Starter App Running.png`
2. `02 Flutter Analysis and Tests Passed.png`
3. `03 Onboarding Screen.png`
4. `04 Dashboard Welcome Alice.png`

These screenshots demonstrate project setup, successful testing, the onboarding screen, named-route navigation, route argument passing, and the final dashboard output.

## Outcome

Practical 4 was completed successfully. The application demonstrates structured Flutter navigation, named routes, data passing, navigation-stack behaviour, and a clear separation between UI, domain, and data layers.
