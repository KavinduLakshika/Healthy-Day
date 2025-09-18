import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/bottom_navigation.dart';
import 'package:healthy_day_mobile/components/card.dart';
import 'package:healthy_day_mobile/components/primary_button.dart';
import 'package:healthy_day_mobile/components/progress.dart';
import 'package:healthy_day_mobile/components/icon_button.dart';
import 'package:healthy_day_mobile/pages/family_member.dart';
import 'package:healthy_day_mobile/pages/more_screen.dart';
import 'package:healthy_day_mobile/pages/pills_screen.dart';
import 'package:healthy_day_mobile/pages/water_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String activeTab = "home";

  final todaysPills = [
    {"name": "Vitamin D", "time": "8:00 AM", "taken": true},
    {"name": "Omega 3", "time": "12:00 PM", "taken": false},
    {"name": "Melatonin", "time": "9:00 PM", "taken": false},
  ];

  final familyMembers = [
    {
      "name": "Mom",
      "avatar": "👩",
      "status": "On track",
      "color": Colors.green,
    },
    {
      "name": "Dad",
      "avatar": "👨",
      "status": "Missed 1",
      "color": Colors.orange,
    },
    {
      "name": "Emma",
      "avatar": "👧",
      "status": "Perfect",
      "color": Colors.green,
    },
  ];

  void onTabChange(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = {
      "home": ListView(
        children: [
          // HEADER
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.healthyBlue, AppColors.healthyTeal],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good morning!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.onPrimary,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Let's stay healthy today",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.healthyPink,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                CardWidget(
                  backgroundColor: Colors.white.withOpacity(0.15),
                  border: Border.all(color: Colors.white30),
                  borderRadius: BorderRadius.circular(16),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.water_drop, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Today's Water",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "1.2L / 2.5L",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Progress(
                        value: 48,
                        height: 6,
                        backgroundColor: Colors.white30,
                        progressColor: Colors.white,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "48% complete",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onTabChange("water"),
                            child: const Text(
                              "Add water →",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // CONTENT
          Container(
            color: Colors.grey[50],
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const Text(
                  "Quick Actions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.healthyLightTeal,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: AppColors.healthyTeal,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () => onTabChange("water"),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.water_drop, size: 24),
                              SizedBox(height: 4),
                              Text("Add Water", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.healthyLightPink,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: AppColors.healthyPink,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () => onTabChange("pills"),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.medication, size: 24),
                              SizedBox(height: 4),
                              Text("Add Pill", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.healthyLightPurple,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: AppColors.healthyPurple,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () => onTabChange("family"),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.group, size: 24),
                              SizedBox(height: 4),
                              Text(
                                "Add Member",
                                style: TextStyle(fontSize: 12),
                                textAlign:
                                    TextAlign.center, // ensures text centers
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Today's Pills
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's Pills",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => onTabChange("pills"),
                      child: const Text(
                        "View all",
                        style: TextStyle(color: AppColors.healthyDarkBlue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  children: todaysPills.map((pill) {
                    return CardWidget(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(24),
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: pill["taken"] == true
                                      ? Colors.green
                                      : Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pill["name"].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    pill["time"].toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (pill["taken"] == false)
                            IntrinsicWidth(
                              child: PrimaryButton(
                                text: "Take",
                                height: 36,
                                color: AppColors.healthyBlue,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // Family Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Family Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => onTabChange("family"),
                      child: const Text(
                        "View all",
                        style: TextStyle(color: AppColors.healthyDarkBlue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: familyMembers.map((member) {
                    return CardWidget(
                      padding: const EdgeInsets.all(12),
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            member["avatar"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            member["name"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            member["status"].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: member["color"] as Color,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      "water": const WaterScreen(),
      "pills": const PillsScreen(),
      "family": const FamilyMember(),
      "more": const MoreScreen(),
    };

    return Scaffold(
      body: pages[activeTab],
      bottomNavigationBar: BottomNavigation(
        activeTab: activeTab,
        onTabChange: onTabChange,
      ),
    );
  }
}
