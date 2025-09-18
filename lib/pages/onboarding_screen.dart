import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const OnboardingScreen({super.key, required this.onComplete});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentSlide = 0;

  final List<Map<String, dynamic>> slides = [
    {
      "title": "Welcome to Healthy Day",
      "subtitle": "Your personal health companion for the whole family",
      "icon": LucideIcons.heart,
      "color": AppColors.healthyPink,
      "description":
          "Take control of your health journey with simple, effective tracking tools designed for everyone.",
    },
    {
      "title": "Stay on Track",
      "subtitle": "Never miss your medications or hydration goals",
      "icon": LucideIcons.shield,
      "color": AppColors.healthyTeal,
      "description":
          "Smart reminders for pills, water intake, and health tracking that adapt to your schedule.",
    },
    {
      "title": "Family Care",
      "subtitle": "Manage health for your loved ones",
      "icon": LucideIcons.users,
      "color": AppColors.healthyPurple,
      "description":
          "Track multiple family members, share reminders, and keep everyone healthy together.",
    },
  ];

  void nextSlide() {
    if (currentSlide < slides.length - 1) {
      setState(() {
        currentSlide++;
      });
    } else {
      widget.onComplete();
    }
  }

  void prevSlide() {
    if (currentSlide > 0) {
      setState(() {
        currentSlide--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final slide = slides[currentSlide];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.healthyLightBlue, AppColors.healthyLightPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(slide["icon"], size: 80, color: slide["color"]),
                      const SizedBox(height: 24),
                      Text(
                        slide["title"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        slide["subtitle"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.healthyDarkBlue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        slide["description"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Progress Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: index == currentSlide ? 24 : 8,
                  decoration: BoxDecoration(
                    color: index == currentSlide
                        ? AppColors.healthyDarkBlue
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                children: [
                  if (currentSlide > 0) ...[
                    Expanded(
                      child: PrimaryButton(
                        text: "Back",
                        onPressed: prevSlide,
                        color: Colors.white,
                        textColor: AppColors.healthyDarkBlue,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: PrimaryButton(
                      text: currentSlide == slides.length - 1
                          ? "Get Started"
                          : "Continue",
                      onPressed: nextSlide,
                      icon: LucideIcons.chevronRight,
                      iconAfter: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
