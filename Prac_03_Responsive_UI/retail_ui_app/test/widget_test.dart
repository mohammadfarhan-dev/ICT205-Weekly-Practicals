import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retail_ui_app/main.dart';

void main() {
  testWidgets('Retail home screen displays all products', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RetailApp());

    expect(find.text('Retail Store'), findsOneWidget);
    expect(find.text('Running Shoes'), findsOneWidget);
    expect(find.text('Wireless Headphones'), findsOneWidget);
    expect(find.text('Backpack'), findsOneWidget);
    expect(find.text('Smart Watch'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });

  testWidgets('Product card opens the product detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RetailApp());

    await tester.tap(find.text('Running Shoes'));
    await tester.pumpAndSettle();

    expect(find.text('Running Shoes'), findsWidgets);
    expect(find.text('\$89.99'), findsOneWidget);
    expect(
      find.text('Lightweight running shoes with breathable mesh soles.'),
      findsOneWidget,
    );
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.text('Buy Now'), findsOneWidget);
  });

  testWidgets('Add to Cart increases the cart counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RetailApp());

    await tester.tap(find.text('Running Shoes'));
    await tester.pumpAndSettle();

    final Finder addToCartButton = find.text('Add to Cart');

    await tester.ensureVisible(addToCartButton);
    await tester.tap(addToCartButton);
    await tester.pump();

    expect(find.text('Running Shoes added to cart'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
  });
}
