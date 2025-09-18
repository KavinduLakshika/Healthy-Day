import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/pages/auth_screen.dart';
import 'package:healthy_day_mobile/pages/dashboard.dart';
import 'package:healthy_day_mobile/pages/onboarding_screen.dart';

void main() {
  runApp(const HealthyDayApp());
}

class HealthyDayApp extends StatelessWidget {
  const HealthyDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return OnboardingScreen(
            onComplete: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => AuthScreen(
                    onAuth: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Dashboard()),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
