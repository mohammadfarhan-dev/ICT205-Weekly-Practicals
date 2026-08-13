import 'package:flutter/material.dart';

import '../../data/user_service.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserService().getUser();

    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/dashboard', arguments: user.name);
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
