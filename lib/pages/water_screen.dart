import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/components/progress_circle.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/card.dart';
import 'package:healthy_day_mobile/components/primary_button.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  double waterIntake = 1200;
  final double dailyGoal = 2500;
  double selectedAmount = 250;

  List<Map<String, dynamic>> todayLog = [
    {"time": "7:30 AM", "amount": 250},
    {"time": "9:15 AM", "amount": 500},
    {"time": "11:00 AM", "amount": 250},
    {"time": "1:30 PM", "amount": 200},
  ];

  final List<double> quickAmounts = [125, 250, 500, 750];

  void addWater(double amount) {
    setState(() {
      waterIntake = (waterIntake + amount).clamp(0, dailyGoal + 1000);
      todayLog.insert(0, {
        "time": TimeOfDay.now().format(context),
        "amount": amount.toInt(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressPercentage = (waterIntake / dailyGoal) * 100;

    return ListView(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.healthyTeal,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  LucideIcons.droplets,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Water Tracker",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Text(
                "Stay hydrated throughout the day",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),

        // Progress Card
        CardWidget(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.white.withOpacity(0.8),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                width: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleProgress(
                      percentage: progressPercentage,
                      strokeWidth: 8,
                      backgroundColor: Colors.grey[300]!,
                      progressColor: AppColors.healthyTeal,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${progressPercentage.toStringAsFixed(0)}%",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.healthyDarkTeal,
                          ),
                        ),
                        const Text(
                          "Complete",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              Text(
                "${(waterIntake / 1000).toStringAsFixed(1)}L",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                "of ${(dailyGoal / 1000).toStringAsFixed(1)}L goal",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),

        // Content
        Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Log Water Intake",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              // Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => setState(() {
                      selectedAmount = (selectedAmount - 125).clamp(125, 1000);
                    }),
                    icon: const Icon(LucideIcons.minus),
                  ),
                  Text(
                    "${selectedAmount.toInt()} ml",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.healthyDarkTeal,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      selectedAmount += 125;
                    }),
                    icon: const Icon(LucideIcons.plus),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Quick Amounts
              Wrap(
                spacing: 8,
                children: quickAmounts.map((amount) {
                  bool active = amount == selectedAmount;
                  return ChoiceChip(
                    label: Text("${amount.toInt()} ml"),
                    selected: active,
                    onSelected: (_) {
                      setState(() => selectedAmount = amount);
                    },
                    selectedColor: AppColors.healthyTeal,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: active ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Add Water Button
              PrimaryButton(
                text: "Add ${selectedAmount.toInt()} ml",
                icon: LucideIcons.droplets,
                onPressed: () => addWater(selectedAmount),
                color: AppColors.healthyTeal,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
