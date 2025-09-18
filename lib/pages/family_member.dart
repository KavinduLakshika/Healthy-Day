import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/card.dart';
import 'package:healthy_day_mobile/components/progress.dart';

class FamilyMember extends StatefulWidget {
  const FamilyMember({super.key});

  @override
  State<FamilyMember> createState() => _FamilyMemberState();
}

class _FamilyMemberState extends State<FamilyMember> {
  final List<Map<String, dynamic>> familyMembers = [
    {
      "id": 1,
      "name": "Sarah (You)",
      "relationship": "Self",
      "avatar": "👩‍💼",
      "pillsToday": 3,
      "pillsTaken": 2,
      "waterGoal": 2.5,
      "waterCurrent": 1.8,
      "status": "on-track",
      "cardColor": AppColors.healthyLightBlue,
    },
    {
      "id": 2,
      "name": "Mike",
      "relationship": "Husband",
      "avatar": "👨‍💼",
      "pillsToday": 2,
      "pillsTaken": 1,
      "waterGoal": 3.0,
      "waterCurrent": 1.2,
      "status": "behind",
      "cardColor": AppColors.healthyLightTeal,
    },
    {
      "id": 3,
      "name": "Emma",
      "relationship": "Daughter",
      "avatar": "👧",
      "pillsToday": 1,
      "pillsTaken": 1,
      "waterGoal": 1.5,
      "waterCurrent": 1.5,
      "status": "perfect",
      "cardColor": AppColors.healthyLightPink,
    },
    {
      "id": 4,
      "name": "Mom",
      "relationship": "Mother",
      "avatar": "👵",
      "pillsToday": 4,
      "pillsTaken": 4,
      "waterGoal": 2.0,
      "waterCurrent": 1.8,
      "status": "perfect",
      "cardColor": AppColors.healthyLightPurple,
    },
  ];

  // Status helpers
  Color getStatusColor(String status) {
    switch (status) {
      case "perfect":
        return Colors.green.shade600;
      case "on-track":
        return Colors.blue.shade600;
      case "behind":
        return Colors.orange.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case "perfect":
        return "Perfect Day";
      case "on-track":
        return "On Track";
      case "behind":
        return "Behind Schedule";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.healthyLightBlue,
      body: Column(
        children: [
          // HEADER
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.healthyPurple, AppColors.healthyPink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Family Health",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Keep everyone on track together",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Stats row
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
                              "4",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Members",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "85%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Avg Adherence",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Need Attention",
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
                    const Text(
                      "Family Members",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 260,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: familyMembers.length + 1,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          if (index == familyMembers.length) {
                            // Add Member Card
                            return CardWidget(
                              backgroundColor: Colors.grey[100],
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                width: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor:
                                          AppColors.healthyLightPurple,
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.healthyPurple,
                                        size: 32,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "Add Member",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Invite a family member",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          final member = familyMembers[index];
                          final pillProgress = member["pillsToday"] > 0
                              ? (member["pillsTaken"] / member["pillsToday"]) *
                                    100
                              : 0.0;
                          final waterProgress =
                              (member["waterCurrent"] / member["waterGoal"]) *
                              100;

                          return CardWidget(
                            backgroundColor: member["cardColor"],
                            borderRadius: BorderRadius.circular(20),
                            padding: const EdgeInsets.all(16),
                            child: SizedBox(
                              width: 180,
                              child: Column(
                                children: [
                                  // Avatar
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Colors.white54,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        member["avatar"],
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  Text(
                                    member["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    member["relationship"],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),

                                  const SizedBox(height: 6),
                                  // Status Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: getStatusColor(
                                        member["status"].toString(),
                                      ).withOpacity(0.1),
                                      border: Border.all(
                                        color: getStatusColor(
                                          member["status"].toString(),
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      getStatusText(member["status"]),
                                      style: TextStyle(
                                        color: getStatusColor(
                                          member["status"].toString(),
                                        ),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Pills",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        "${member["pillsTaken"]}/${member["pillsToday"]}",
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  Progress(
                                    value: pillProgress,
                                    height: 6,
                                    backgroundColor: Colors.white30,
                                    progressColor: Colors.grey.shade800,
                                  ),

                                  const SizedBox(height: 8),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Water",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        "${member["waterCurrent"]}L/${member["waterGoal"]}L",
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  Progress(
                                    value: waterProgress,
                                    height: 6,
                                    backgroundColor: Colors.white30,
                                    progressColor: Colors.grey.shade800,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Quick Actions
                    const Text(
                      "Quick Actions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: CardWidget(
                            backgroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: AppColors.healthyLightBlue,
                                  child: Icon(
                                    Icons.people,
                                    color: AppColors.healthyDarkBlue,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Family Chat",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Send encouragement",
                                        style: TextStyle(fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: CardWidget(
                            backgroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: AppColors.healthyLightPink,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: AppColors.healthyDarkPink,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Weekly Report",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "View progress",
                                        style: TextStyle(fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
