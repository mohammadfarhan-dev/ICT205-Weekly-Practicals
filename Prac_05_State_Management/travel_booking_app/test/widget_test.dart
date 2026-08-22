import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking_app/main.dart';
import 'package:travel_booking_app/providers/booking_provider.dart';

Widget createTestApp() {
  return ChangeNotifierProvider(
    create: (_) => BookingProvider(),
    child: const MyApp(),
  );
}

void main() {
  testWidgets('Travel booking app shows initial booking details', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(createTestApp());

    expect(find.text('Travel Booking'), findsOneWidget);
    expect(find.text('Paris'), findsOneWidget);
    expect(find.text('1 Traveller'), findsOneWidget);
    expect(find.text('\$200'), findsOneWidget);
    expect(find.text('View Summary'), findsOneWidget);
    expect(find.byType(Slider), findsOneWidget);
  });

  testWidgets('Traveller update changes price reactively', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(createTestApp());

    final sliderFinder = find.byType(Slider);

    expect(sliderFinder, findsOneWidget);

    final Slider slider = tester.widget<Slider>(sliderFinder);

    slider.onChanged!(4);

    await tester.pump();

    expect(find.text('4 Travellers'), findsOneWidget);
    expect(find.text('\$800'), findsOneWidget);
  });

  testWidgets('View Summary navigates and displays booking state', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(createTestApp());

    // Update the booking state to 4 travellers.
    final Slider slider = tester.widget<Slider>(
      find.byType(Slider),
    );

    slider.onChanged!(4);

    await tester.pump();

    expect(find.text('4 Travellers'), findsOneWidget);
    expect(find.text('\$800'), findsOneWidget);

    // The button is lower on the styled screen, so scroll it
    // into the widget-test viewport before tapping.
    final summaryButton = find.byType(ElevatedButton);

    expect(summaryButton, findsOneWidget);

    await tester.ensureVisible(summaryButton);
    await tester.pumpAndSettle();

    await tester.tap(summaryButton);
    await tester.pumpAndSettle();

    // Confirm navigation and shared Provider state.
    expect(find.text('Booking Summary'), findsOneWidget);
    expect(find.text('Your Trip Summary'), findsOneWidget);
    expect(find.text('Paris'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('\$800'), findsOneWidget);
  });
}