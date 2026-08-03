# ICT205 Practical 2 – Discount Calculator App

## Overview

This practical demonstrates how to separate Dart business logic from a Flutter user interface and how to handle invalid user input safely.

The application calculates the final price of an item after applying a percentage discount.

## Objectives

The objectives of this practical were to:

- Create a Dart business logic module.
- Connect the business logic to a Flutter user interface.
- Accept user input through text fields.
- Calculate the final discounted price.
- Display the amount saved.
- Validate empty, invalid, negative, and out-of-range input.
- Use exception handling to prevent application crashes.
- Test the application on an Android emulator.

## Project Structure

```text
discount_app/
├── lib/
│   ├── discount_logic.dart
│   └── main.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
└── README.md
```

## Business Logic

The calculation is handled separately in:

```text
lib/discount_logic.dart
```

The application uses the following calculation:

```text
Final Price = Original Price - (Original Price × Discount Percentage ÷ 100)
```

The logic also checks that:

- The original price is not negative.
- The discount percentage is between 0 and 100.

## User Interface

The Flutter interface contains:

- Original price input field
- Discount percentage input field
- Calculate button
- Clear button
- Result display area
- Validation and error messages

## Example Calculation

Input:

```text
Original Price: 100
Discount Percentage: 20
```

Output:

```text
Final Price: $80.00
You Save: $20.00
```

## Validation

The application validates the following cases:

- Empty original price
- Empty discount percentage
- Non-numeric input
- Negative price
- Discount below 0
- Discount above 100

For an invalid discount such as `120`, the application displays:

```text
Discount must be between 0 and 100.
Please correct the highlighted fields.
```

## Testing

The application was tested on a Pixel 6 Android emulator.

The successful calculation test confirmed that a price of `100` with a `20%` discount produces a final price of `$80.00` and a saving of `$20.00`.

The validation test confirmed that a discount of `120%` is rejected and an appropriate error message is displayed.

The project can be checked using:

```bash
dart format lib test
flutter analyze
flutter test
```

## Evidence

Screenshots are available in the `evidence` folder:

1. `01 Successful Discount Calculation.png`
2. `02 Invalid Discount Validation.png`

## Outcome

The Discount Calculator application was completed successfully. The Dart business logic is separated from the Flutter interface, valid calculations work correctly, and invalid input is handled without crashing the application.
