import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_lab/main.dart';

void main() {
  testWidgets('Onboarding screen displays correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NavigationLabApp());

    expect(find.text('Onboarding'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Continue navigates to dashboard with Alice', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NavigationLabApp());

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Welcome Alice'), findsOneWidget);
  });
}
