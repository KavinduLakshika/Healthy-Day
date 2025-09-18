import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:healthy_day_mobile/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const BottomNavigation({
    super.key,
    required this.activeTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {"id": "home", "label": "Home", "icon": LucideIcons.home},
      {"id": "water", "label": "Water", "icon": LucideIcons.droplets},
      {"id": "pills", "label": "Pills", "icon": LucideIcons.pill},
      {"id": "family", "label": "Family", "icon": LucideIcons.users},
      {"id": "more", "label": "More", "icon": LucideIcons.moreHorizontal},
    ];

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: AppColors.healthyBlue, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tabs.map((tab) {
            final bool isActive = activeTab == tab["id"];
            return GestureDetector(
              onTap: () => onTabChange(tab["id"] as String),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.healthyLightBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      tab["icon"] as IconData,
                      size: 24,
                      color: isActive
                          ? AppColors.healthyDarkBlue
                          : AppColors.healthyDarkBlue,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tab["label"] as String,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isActive
                            ? AppColors.healthyDarkBlue
                            : AppColors.healthyDarkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
