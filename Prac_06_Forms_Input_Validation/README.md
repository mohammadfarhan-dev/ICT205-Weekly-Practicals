# ICT205 Practical 6 – Forms, Input & Validation

## Overview

This practical demonstrates form handling, user input, validation, secure password entry, and structured data preparation in Flutter.

A registration form was developed with fields for Full Name, Email, Password, and Role. The form validates user input before submission and prepares the submitted data in a structured map.

## Project

Flutter project:

`flutter_forms_lab`

Portfolio structure:

```text
Prac_06_Forms_Input_Validation/
├── README.md
├── evidence/
└── flutter_forms_lab/
```

## Practical Requirements Demonstrated

- Flutter `Form`
- `GlobalKey<FormState>`
- `TextEditingController`
- Full Name input
- Email input
- Password input
- Role dropdown
- Student and Admin role options
- Required field validation
- Email format validation
- Minimum password length validation
- Secure password entry using `obscureText`
- Password suggestions disabled
- Autocorrect disabled for password input
- Structured `userData`
- Successful form submission
- Clean Material interface
- Flutter widget testing
- Flutter static analysis

## Form Structure

The registration screen contains the following fields:

- Full Name
- Email
- Password
- Role

The form is managed using:

```dart
final _formKey = GlobalKey<FormState>();
```

Text editing controllers are used for the main input fields:

```dart
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
```

The controllers are disposed when the screen is removed to avoid unnecessary resource usage.

## Validation

The form validates each field before submission.

### Full Name

The name field must not be empty.

Validation message:

```text
Name is required
```

### Email

The email field must not be empty and must contain a valid email format.

Validation messages:

```text
Email is required
Enter a valid email
```

### Password

The password must contain at least 6 characters.

Validation message:

```text
Password must be at least 6 characters
```

### Role

The user must select a role.

Available options:

```text
Student
Admin
```

Validation message:

```text
Please select a role
```

## Secure Password Input

The password field uses:

```dart
obscureText: true
enableSuggestions: false
autocorrect: false
```

This prevents the password from being displayed normally and disables text suggestions and autocorrect for the password input.

## Form Submission

When all validation rules pass, the form prepares structured user data:

```dart
final userData = {
  'name': nameController.text.trim(),
  'email': emailController.text.trim(),
  'password': passwordController.text,
  'role': role,
};
```

The structured data is printed to the console as required by the practical.

Example:

```text
{name: John Smith, email: john@example.com, password: 123456, role: Student}
```

The application also displays:

```text
Registration successful
```

after successful validation and submission.

## User Interface

The registration form uses a clean Material interface with:

- Register app bar
- Create Account heading
- Full Name field
- Email field
- Secure Password field
- Role dropdown
- Register button
- Clear validation messages
- Consistent spacing and icons

## Testing

The project was formatted and checked using:

```text
dart format lib test
flutter analyze
flutter test
```

Final static analysis result:

```text
No issues found!
```

Final automated testing result:

```text
All tests passed!
```

Four widget tests were implemented.

### Test 1 – Registration Form Structure

Verifies that the form displays:

- Create Account
- Full Name
- Email
- Password
- Role
- Register button

### Test 2 – Empty Form Validation

Verifies that submitting an empty form displays:

```text
Name is required
Email is required
Password must be at least 6 characters
Please select a role
```

### Test 3 – Invalid Input Validation

Verifies that an invalid email and short password display:

```text
Enter a valid email
Password must be at least 6 characters
```

### Test 4 – Successful Registration

Verifies that valid form data can be submitted successfully and displays:

```text
Registration successful
```

## Evidence

The `evidence` folder contains:

```text
01 Registration Form.png
02 Empty Form Validation.png
03 Invalid Input Validation.png
04 Successful Registration.png
05 Flutter Analyze No Issues.png
06 Flutter Tests Passed.png
```

### Evidence 1 – Registration Form

Shows the completed registration form interface.

### Evidence 2 – Empty Form Validation

Shows validation messages when the form is submitted without entering any data.

### Evidence 3 – Invalid Input Validation

Shows the invalid email and short password validation messages.

### Evidence 4 – Successful Registration

Shows valid user information, selected role, and the successful registration message.

### Evidence 5 – Flutter Analyze

Shows:

```text
No issues found!
```

### Evidence 6 – Flutter Tests

Shows:

```text
All tests passed!
```

## Outcome

Practical 6 was completed successfully.

The final registration application demonstrates:

- Flutter form handling
- Input controllers
- Form validation
- Email validation
- Password validation
- Secure password entry
- Role selection
- Structured form data preparation
- Clear validation feedback
- Successful form submission
- Automated widget testing
- Successful Flutter static analysis

The practical meets the requirements for Form Structure, Validation & UX, and Security & Data Preparation.
