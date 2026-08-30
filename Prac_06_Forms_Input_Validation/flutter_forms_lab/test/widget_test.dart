import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_forms_lab/main.dart';

void configureTestScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(800, 1000);
  tester.view.devicePixelRatio = 1.0;

  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('Registration form displays required fields', (
    WidgetTester tester,
  ) async {
    configureTestScreen(tester);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Role'), findsOneWidget);

    expect(find.byType(TextFormField), findsNWidgets(3));

    expect(find.widgetWithText(ElevatedButton, 'Register'), findsOneWidget);
  });

  testWidgets('Empty form displays validation messages', (
    WidgetTester tester,
  ) async {
    configureTestScreen(tester);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final registerButton = find.widgetWithText(ElevatedButton, 'Register');

    expect(registerButton, findsOneWidget);

    await tester.tap(registerButton);
    await tester.pump();

    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    expect(find.text('Please select a role'), findsOneWidget);
  });

  testWidgets('Invalid email and short password show errors', (
    WidgetTester tester,
  ) async {
    configureTestScreen(tester);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);

    await tester.enterText(fields.at(0), 'John Smith');
    await tester.enterText(fields.at(1), 'john');
    await tester.enterText(fields.at(2), '123');

    final dropdown = find.byType(DropdownButtonFormField<String>);

    expect(dropdown, findsOneWidget);

    await tester.tap(dropdown);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Student').last);
    await tester.pumpAndSettle();

    final registerButton = find.widgetWithText(ElevatedButton, 'Register');

    await tester.tap(registerButton);
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
  });

  testWidgets('Valid registration displays success message', (
    WidgetTester tester,
  ) async {
    configureTestScreen(tester);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);

    await tester.enterText(fields.at(0), 'John Smith');
    await tester.enterText(fields.at(1), 'john@example.com');
    await tester.enterText(fields.at(2), '123456');

    final dropdown = find.byType(DropdownButtonFormField<String>);

    await tester.tap(dropdown);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Student').last);
    await tester.pumpAndSettle();

    final registerButton = find.widgetWithText(ElevatedButton, 'Register');

    await tester.tap(registerButton);
    await tester.pump();

    expect(find.text('Registration successful'), findsOneWidget);
  });
}
