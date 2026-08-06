# ICT205 Practical 3 – Responsive Retail Shopping App UI

## Overview

This practical demonstrates the development of a responsive, accessible, themed, multi-screen Flutter retail shopping application.

The application allows shoppers to:

- Browse a product catalogue
- View product details
- Navigate between screens
- Add products to a cart
- Use both Material and Cupertino interface components
- Experience layouts that adapt to different screen widths

## Project Information

- **Unit:** ICT205 Mobile Application Development
- **Practical:** Practical Lab 3 – Revised Edition
- **Topic:** Flutter UI Systems & Responsive Design
- **Industry Scenario:** Retail and E-Commerce
- **Flutter Project:** `retail_ui_app`

## Learning Objectives Demonstrated

This project demonstrates:

- Flutter project creation and structure
- `Scaffold` and `AppBar`
- Product modelling with a Dart class
- Product listing with `GridView.builder`
- Reusable product cards
- Navigation with `Navigator.push`
- Data passing through constructors
- Responsive layouts with `LayoutBuilder`
- Material and Cupertino controls
- Global theming with `ThemeData`
- Typography using `TextTheme`
- Semantic labels
- Large-text accessibility support
- State handling with `StatefulWidget` and `setState`
- Callback-based cart updates

## Project Structure

```text
Prac_03_Responsive_UI/
├── README.md
├── evidence/
│   ├── 01 Default Flutter Counter App Checkpoint.png
│   ├── 02 Mobile Home Product Grid.png
│   ├── 03 Mobile Product Detail Screen.png
│   ├── 04 Material Add to Cart Interaction.png
│   ├── 05 Cupertino Buy Now Interaction.png
│   ├── 06 Mobile Cart Counter Updated.png
│   ├── 07 Three Column Responsive Layout.png
│   ├── 08 Four Column Wide Responsive Layout.png
│   ├── 09 Wide Product Detail with Material and Cupertino Buttons.png
│   ├── 10 Accessibility Large Text Test.png
│   ├── 11 Mobile Landscape Responsive Layout.png
│   ├── 12 Flutter Analysis and Widget Tests Passed.png
│   └── Evidence Index.txt
└── retail_ui_app/
    ├── lib/
    │   └── main.dart
    ├── test/
    │   └── widget_test.dart
    ├── pubspec.yaml
    └── analysis_options.yaml
```

## Application Features

### Home Screen

The home screen contains:

- A `Retail Store` app bar
- A shopping cart icon
- A live cart counter
- Four product cards
- Product image placeholders using icons
- Product names
- Product prices
- Responsive grid behaviour

The sample catalogue contains:

1. Running Shoes – `$89.99`
2. Wireless Headphones – `$129.00`
3. Backpack – `$59.50`
4. Smart Watch – `$199.99`

### Product Detail Screen

Selecting a product opens a separate details screen containing:

- Product image placeholder
- Product name
- Product price
- Product description
- Material `Add to Cart` button
- Cupertino `Buy Now` button
- Back navigation

### Cart State

The home screen uses `StatefulWidget` and `setState` to maintain the cart count.

When the user taps **Add to Cart**:

- A callback is passed from the home screen to the product card and then to the product detail screen.
- The cart count increases.
- A confirmation `SnackBar` appears.
- The updated cart count remains visible after returning to the home screen.

## Responsive Design

The product grid uses `LayoutBuilder` and the available width to determine the number of columns.

```text
Width below or equal to 600 px: 2 columns
Width above 600 px: 3 columns
Width above 900 px: 4 columns
```

This supports:

- Mobile portrait layout
- Mobile landscape layout
- Tablet-width layout
- Wide desktop or browser layout

Responsive testing confirmed that:

- The Pixel 6 portrait layout uses 2 columns.
- The Pixel 6 landscape layout uses 3 columns.
- A medium browser width uses 3 columns.
- A wide browser window uses 4 columns.
- No layout overflow appears at the tested widths.

## Material and Cupertino Reflection

The application includes both a Material `ElevatedButton` and a Cupertino `CupertinoButton.filled`.

The Material **Add to Cart** button follows Android-style interaction patterns. It uses Material theming, elevation, and ripple feedback when pressed. This style feels consistent with the rest of the `MaterialApp` interface and matches what Android users commonly expect.

The Cupertino **Buy Now** button uses a flatter iOS-style appearance. Its interaction feedback is based on an opacity fade instead of the Material ripple effect. Cupertino controls also tend to use smoother, simpler visual styling that reflects Apple platform conventions.

Using both controls demonstrates that Flutter can combine Material and Cupertino widgets within one application. A cross-platform application may use Material controls everywhere for consistency, or it may use platform-specific controls to better match Android and iOS user expectations.

## Theming and Typography

The project uses a single global `ThemeData` configuration.

Key theming features include:

- Material 3 enabled with `useMaterial3: true`
- Global colour generation with `ColorScheme.fromSeed`
- Purple seed colour
- Centralised typography through `TextTheme`
- Shared card styling through `CardThemeData`
- Theme-derived product card and icon colours

Using global theming avoids repeating hardcoded colours and styles throughout the application. It also makes future design changes easier because the main theme can be updated from one location.

## Accessibility Considerations

Accessibility was considered through semantic labels, text-scaling-safe layouts, and readable colour contrast.

### Semantic Labels

The product image placeholders are icons rather than real images. Each product icon is wrapped in a `Semantics` widget with a meaningful label such as:

```text
Running Shoes product image
```

This helps screen readers identify what the visual placeholder represents instead of treating it as an unexplained decorative icon.

The shopping cart area also includes a semantic label describing the current number of items in the cart.

### Text Scaling

Flutter respects the device's accessibility font-size settings. The project uses text styles from `Theme.of(context).textTheme`, allowing text to scale according to the user's system settings.

To prevent long product names from overflowing when large text is enabled, product names use:

```dart
maxLines: 1
overflow: TextOverflow.ellipsis
```

Testing with the Pixel 6 font size increased to the largest setting confirmed that long names such as `Wireless Headphones` shorten safely with an ellipsis. Prices remain visible, cards remain usable, and no yellow-and-black overflow warning appears.

The product details screen is also scrollable. This ensures that larger text and longer descriptions can wrap onto additional lines without making the content inaccessible.

### Colour Contrast

The application uses `ColorScheme.fromSeed`, which generates coordinated Material 3 colours for backgrounds, surfaces, icons, and foreground text.

Product card backgrounds and icons use theme-derived colour pairs rather than manually selected light-on-light combinations. This improves readability and supports consistent contrast throughout the interface.

## Navigation and Data Passing

Product cards use `InkWell` to provide visible Material tap feedback.

When a card is selected:

- `Navigator.push` opens a new route.
- `MaterialPageRoute` provides the standard Material transition.
- The selected `Product` object is passed directly into `ProductDetailScreen`.
- The cart callback is also passed to the details screen.

This demonstrates both navigation and data transfer between screens.

## Testing

The app was manually tested on:

- Pixel 6 Android emulator
- Mobile portrait orientation
- Mobile landscape orientation
- Google Chrome at medium width
- Google Chrome at wide width
- Android large-font accessibility setting

The following commands were run:

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

## Automated Widget Tests

The widget tests confirm that:

- The Retail Store home screen loads.
- All four products are displayed.
- The shopping cart icon is visible.
- Selecting a product opens the correct detail screen.
- Product details, price, description, and both buttons are displayed.
- Tapping **Add to Cart** shows a confirmation message.
- Returning to the home screen shows the incremented cart count.

## Evidence

The `evidence` folder contains screenshots demonstrating:

- Default Flutter counter app checkpoint
- Mobile product grid
- Product detail navigation
- Material Add to Cart interaction
- Cupertino Buy Now interaction
- Cart count update
- Three-column responsive layout
- Four-column responsive layout
- Wide product detail layout
- Large-text accessibility behaviour
- Mobile landscape responsiveness
- Successful formatting, analysis, and widget tests

## Outcome

The Practical 3 Retail Shopping App was completed successfully.

It meets the required criteria for:

- Multi-screen UI design
- Responsive layouts
- Material and Cupertino controls
- Global theming and typography
- Accessibility
- Navigation and data passing
- Basic shared state handling
- Manual and automated testing
