# ICT205 Practical 1 – Flutter Installation and Setup

## Overview

This practical documents the installation, configuration, and verification of a Flutter development environment on Windows. It also demonstrates the successful creation and execution of the default Flutter counter application on an Android emulator.

## Objectives

The objectives of this practical were to:

- Install and verify Git.
- Install and configure the Flutter SDK.
- Confirm that Flutter is available through the Windows command line.
- Install Android Studio and the Android SDK.
- Accept the required Android licences.
- Install the Flutter and Dart extensions in Visual Studio Code.
- Create and start an Android Virtual Device.
- Create a Flutter project.
- Run and test the Flutter application on an Android emulator.

## Development Environment

The following tools were verified during the practical:

- **Operating system:** Windows 10 Pro 64-bit
- **Git:** 2.45.1
- **Flutter:** 3.41.4, stable channel
- **Dart:** 3.11.1
- **Android Studio:** Installed and configured
- **Android SDK:** Installed and detected by Flutter
- **Android emulator:** Pixel 6, Android 16, API 36
- **Visual Studio Code:** Flutter and Dart extensions installed

## Project Structure

```text
Prac_01_Flutter_Installation/
├── README.md
├── evidence/
│   ├── 01 Git and Flutter Version Verification.png
│   ├── 02 Flutter Doctor - No Issues Found.png
│   ├── 03 Android Emulator Detected by Flutter.png
│   ├── 04 Dart Extension Installed in VS Code.png
│   ├── 05 Flutter Extension Installed in VS Code.png
│   ├── 06 Flutter Project and App Running on Pixel 6.png
│   └── 07 Counter Button Functionality Test.png
└── my_first_app/
    ├── android/
    ├── ios/
    ├── lib/
    │   └── main.dart
    ├── test/
    ├── web/
    ├── windows/
    ├── pubspec.yaml
    └── .gitignore
```

## Installation Verification

Git was verified using:

```bash
git --version
```

Flutter was verified using:

```bash
flutter --version
```

The complete development environment was checked using:

```bash
flutter doctor -v
```

The result confirmed that the Flutter installation, Android toolchain, Android licences, development tools, and network resources were available. Flutter Doctor reported **No issues found**.

## Android Emulator Verification

The connected devices were checked using:

```bash
flutter devices
```

Flutter successfully detected the Pixel 6 Android emulator as an available mobile device.

## Flutter Application

The first Flutter project was created with:

```bash
flutter create my_first_app
```

The application was launched on the Android emulator using:

```bash
cd my_first_app
flutter run
```

The default Flutter counter application opened successfully on the Pixel 6 emulator.

## Functional Testing

The floating action button was pressed several times. The displayed counter changed from `0` to `3`, confirming that:

- The application launched correctly.
- The Android emulator communicated successfully with Flutter.
- User interaction was processed correctly.
- The application state updated correctly.

## Evidence

The `evidence` folder contains screenshots showing:

1. Git and Flutter version verification.
2. Flutter Doctor reporting no issues.
3. Detection of the Android emulator.
4. Installation of the Dart extension in Visual Studio Code.
5. Installation of the Flutter extension in Visual Studio Code.
6. The Flutter project and application running on the Pixel 6 emulator.
7. Successful counter-button functionality testing.

## Outcome

The Flutter development environment was installed and configured successfully. The Android emulator was detected, and the first Flutter application ran and responded correctly to user input. The system is ready for the remaining ICT205 mobile application development practicals.
