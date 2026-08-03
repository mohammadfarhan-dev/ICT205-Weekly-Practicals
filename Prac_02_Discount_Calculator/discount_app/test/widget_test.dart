import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:discount_app/main.dart';

void main() {
  testWidgets('Discount calculator displays its main interface', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DiscountCalculatorApp());

    expect(find.text('Discount Calculator'), findsOneWidget);
    expect(find.text('Calculate Your Discount'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Clear'), findsOneWidget);
  });

  testWidgets('Calculates the correct discounted price', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DiscountCalculatorApp());

    final Finder textFields = find.byType(TextFormField);

    await tester.enterText(textFields.at(0), '100');
    await tester.enterText(textFields.at(1), '20');

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.textContaining('Final Price: \$80.00'), findsOneWidget);
    expect(find.textContaining('You Save: \$20.00'), findsOneWidget);
  });

  testWidgets('Shows validation errors when fields are empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DiscountCalculatorApp());

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.text('Please enter the original price.'), findsOneWidget);

    expect(find.text('Please enter the discount percentage.'), findsOneWidget);
  });

  testWidgets('Clear button resets the entered information', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DiscountCalculatorApp());

    final Finder textFields = find.byType(TextFormField);

    await tester.enterText(textFields.at(0), '100');
    await tester.enterText(textFields.at(1), '20');

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.textContaining('Final Price: \$80.00'), findsOneWidget);

    await tester.tap(find.text('Clear'));
    await tester.pump();

    expect(
      find.text('Enter the price and discount percentage.'),
      findsOneWidget,
    );

    final TextFormField priceField = tester.widget<TextFormField>(
      textFields.at(0),
    );

    final TextFormField discountField = tester.widget<TextFormField>(
      textFields.at(1),
    );

    expect(priceField.controller?.text, isEmpty);
    expect(discountField.controller?.text, isEmpty);
  });
}
