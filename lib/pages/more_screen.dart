import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/card.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List<Map<String, dynamic>> healthFeatures = [
    {
      "id": "period-tracker",
      "title": "Period Tracker",
      "description": "Track your cycle and symptoms",
      "icon": Icons.calendar_today,
      "color": AppColors.healthyLightPink,
      "iconColor": AppColors.healthyDarkPink,
    },
    {
      "id": "prescriptions",
      "title": "Prescription Storage",
      "description": "Store and share prescriptions",
      "icon": Icons.camera_alt,
      "color": AppColors.healthyLightPurple,
      "iconColor": AppColors.healthyDarkPurple,
    },
    {
      "id": "notifications",
      "title": "Notifications",
      "description": "Manage your reminders",
      "icon": Icons.notifications,
      "color": AppColors.healthyLightBlue,
      "iconColor": AppColors.healthyDarkBlue,
    },
  ];

  final List<Map<String, dynamic>> accountItems = [
    {
      "id": "profile",
      "title": "Profile & Account",
      "icon": Icons.person,
      "action": () => debugPrint("Navigate Profile"),
    },
    {
      "id": "settings",
      "title": "Settings",
      "icon": Icons.settings,
      "action": () => debugPrint("Navigate Settings"),
    },
    {
      "id": "privacy",
      "title": "Privacy & Security",
      "icon": Icons.security,
      "action": () => debugPrint("Privacy Settings"),
    },
    {
      "id": "help",
      "title": "Help & Support",
      "icon": Icons.help_outline,
      "action": () => debugPrint("Help & Support"),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.healthyLightBlue,
      body: Column(
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.healthyBlue, AppColors.healthyPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
            child: Column(
              children: [
                // Avatar + Name + Email
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Text(
                    "SJ",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Sarah Johnson",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "sarah.johnson@email.com",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),

                // Quick Stats
                CardWidget(
                  backgroundColor: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "15",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Day Streak",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "92%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Adherence",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "4",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Family Members",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Health Features
                    const Text(
                      "Health Features",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: healthFeatures.map((feature) {
                        return CardWidget(
                          borderRadius: BorderRadius.circular(12),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: feature["color"],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  feature["icon"],
                                  size: 20,
                                  color: feature["iconColor"],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      feature["title"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      feature["description"],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Account
                    const Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CardWidget(
                      borderRadius: BorderRadius.circular(12),
                      backgroundColor: Colors.white,
                      child: Column(
                        children: accountItems.map((item) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(item["icon"], color: Colors.grey),
                                title: Text(
                                  item["title"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                onTap: item["action"],
                              ),
                              if (item != accountItems.last)
                                const Divider(height: 1),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Logout
                    CardWidget(
                      borderRadius: BorderRadius.circular(12),
                      backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: () => debugPrint("Sign out tapped"),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.logout, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                "Sign Out",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
