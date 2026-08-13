import 'package:flutter/material.dart';

import 'ui/screens/dashboard_screen.dart';
import 'ui/screens/onboarding_screen.dart';

void main() {
  runApp(const NavigationLabApp());
}

class NavigationLabApp extends StatelessWidget {
  const NavigationLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Lab',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
