import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/booking_provider.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/summary_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookingProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/summary': (context) => const SummaryScreen(),
      },
    );
  }
}
