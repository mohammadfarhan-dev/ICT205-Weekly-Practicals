# ICT205 Practical 5 – State Management

## Overview

This practical demonstrates state management in Flutter using the Provider package.

A Travel Experience Booking App was developed where the user can select the number of travellers using a slider. The traveller count and total booking price update reactively through a centralised `BookingProvider`.

The application also uses named routes to navigate from the Travel Booking screen to a Booking Summary screen while preserving the same booking state.

## Project

Flutter project:

`travel_booking_app`

Portfolio structure:

```text
Prac_05_State_Management/
├── README.md
├── evidence/
└── travel_booking_app/
```

## Practical Requirements Demonstrated

- Flutter Provider package
- `ChangeNotifier`
- Centralised application state
- `notifyListeners()`
- Reactive UI updates
- Traveller slider from 1 to 10
- Dynamic price calculation
- Booking domain model
- Provider and domain integration
- Named route navigation
- Home to Summary navigation flow
- Shared state between screens
- UI, Domain, Data, and Provider folder structure
- Clean Material Design interface
- Automated Flutter widget testing
- Flutter static analysis

## Application Flow

```text
Travel Booking Screen
        ↓
Select Travellers
        ↓
BookingProvider updates state
        ↓
Traveller Count and Price update reactively
        ↓
View Summary
        ↓
Booking Summary Screen
```

## State Management

The application uses the `provider` package to manage the booking state.

`BookingProvider` extends `ChangeNotifier` and manages the current booking through the `Booking` domain model.

The initial booking state is:

```text
Destination: Paris
Travellers: 1
Price: $200
```

When the traveller count changes, the provider recalculates the booking price using:

```text
Price = Travellers × $200
```

For example:

```text
4 Travellers = $800
```

After the state changes, `notifyListeners()` notifies listening widgets so the interface updates immediately.

## Layered Architecture

The Flutter application is organised into logical layers:

```text
lib/
├── data/
├── domain/
│   └── booking.dart
├── providers/
│   └── booking_provider.dart
├── ui/
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── summary_screen.dart
│   └── widgets/
└── main.dart
```

### UI Layer

The UI layer contains the application screens.

`HomeScreen` displays the destination, traveller count, total price, traveller slider, and View Summary button.

The traveller slider allows values from 1 to 10 and updates the booking state reactively.

`SummaryScreen` displays the current destination, traveller count, and total booking price using the same Provider state.

### Domain Layer

The domain layer contains:

`booking.dart`

The `Booking` model stores:

- Destination
- Number of travellers
- Price

This keeps the booking data separate from the UI.

### Provider Layer

The provider layer contains:

`booking_provider.dart`

`BookingProvider` manages the central booking state and extends `ChangeNotifier`.

The state flow is:

```text
UI
 ↓
BookingProvider
 ↓
Booking Model
```

When the traveller count changes, `BookingProvider`:

1. Updates the number of travellers.
2. Recalculates the total price.
3. Calls `notifyListeners()`.
4. Causes listening widgets to rebuild with the new state.

### Data Layer

A dedicated `data` folder is included as part of the layered architecture.

It is available for future persistence, API integration, or other external data sources.

## Provider Setup

The application is wrapped with `ChangeNotifierProvider` in `main.dart`.

```dart
ChangeNotifierProvider(
  create: (_) => BookingProvider(),
  child: const MyApp(),
)
```

This makes the same `BookingProvider` instance available to the application screens.

The UI accesses the provider using:

```dart
Provider.of<BookingProvider>(context)
```

## Reactive UI Updates

The traveller slider supports values from 1 to 10.

Changing the slider updates both:

- Traveller count
- Total booking price

For example:

```text
1 Traveller → $200
4 Travellers → $800
```

The interface updates immediately because the Provider calls `notifyListeners()` after the booking state changes.

## Navigation and Routing

The application uses named routes through `MaterialApp`.

```text
/           → HomeScreen
/summary    → SummaryScreen
```

The Travel Booking screen navigates to the Booking Summary screen using:

```dart
Navigator.pushNamed(context, '/summary');
```

Because `BookingProvider` wraps the application, the Summary screen accesses the same booking state without manually passing the destination, traveller count, or price between screens.

## User Interface

The application includes a clean and simple travel-booking interface.

The Home screen contains:

- Travel Booking app bar
- Travel icon
- Destination information
- Traveller information
- Total booking price
- Traveller slider
- View Summary button

The Summary screen contains:

- Booking Summary app bar
- Confirmation icon
- Destination
- Travellers
- Total Price
- Booking information message

The interface uses Material widgets, consistent spacing, cards, icons, and clear typography.

## Testing

The project was checked using:

```text
dart format lib test
flutter analyze
flutter test
```

The final static analysis result was:

```text
No issues found!
```

The final automated testing result was:

```text
All tests passed!
```

Three widget tests were implemented.

### Test 1 – Initial Booking Details

Verifies that the application initially displays:

- Travel Booking
- Paris
- 1 Traveller
- $200
- View Summary button
- Traveller slider

### Test 2 – Reactive Traveller and Price Update

Verifies that updating the traveller count to 4 changes the interface to:

```text
4 Travellers
$800
```

This confirms that Provider state changes are reflected reactively in the UI.

### Test 3 – Navigation and Shared Provider State

Verifies that:

- The booking is changed to 4 travellers.
- The View Summary button navigates to the Summary screen.
- The Summary screen displays Paris.
- The traveller count remains 4.
- The total price remains $800.

This confirms that Provider state is preserved across navigation.

## Evidence

The `evidence` folder contains the following screenshots:

```text
01 Travel Booking Home Screen.png
02 Reactive Traveller and Price Update.png
03 Booking Summary Provider State.png
04 Flutter Analyze No Issues.png
05 Flutter Tests Passed.png
```

### Evidence 1 – Travel Booking Home Screen

Shows the initial booking state:

```text
Destination: Paris
Travellers: 1
Total Price: $200
```

### Evidence 2 – Reactive Traveller and Price Update

Shows the slider changed to 4 travellers and the total price updating automatically to:

```text
$800
```

### Evidence 3 – Booking Summary Provider State

Shows successful navigation to the Booking Summary screen while preserving:

```text
Destination: Paris
Travellers: 4
Total Price: $800
```

### Evidence 4 – Flutter Analyze

Shows:

```text
No issues found!
```

### Evidence 5 – Flutter Tests

Shows:

```text
All tests passed!
```

## Outcome

Practical 5 was completed successfully.

The final Travel Experience Booking App demonstrates:

- Provider-based state management
- Centralised booking state
- `ChangeNotifier`
- `notifyListeners()`
- Reactive UI updates
- Dynamic traveller and price calculation
- Domain and Provider integration
- Layered Flutter architecture
- Named-route navigation
- Shared state across screens
- Clean and usable interface
- Automated widget testing
- Successful Flutter static analysis

The application meets the Practical 5 requirements for state management, reactive UI behaviour, navigation, architecture, usability, and code quality.
