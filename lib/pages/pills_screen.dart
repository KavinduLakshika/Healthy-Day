import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/card.dart';
import 'package:healthy_day_mobile/components/primary_button.dart';

class PillsScreen extends StatefulWidget {
  const PillsScreen({super.key});

  @override
  State<PillsScreen> createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen> {
  String selectedFilter = "all";

  List<Map<String, dynamic>> medications = [
    {
      "id": 1,
      "name": "Vitamin D",
      "dosage": "1000 IU",
      "frequency": "Once daily",
      "nextDose": "8:00 AM",
      "color": Colors.yellow,
      "taken": true,
      "timesTaken": 15,
      "totalDoses": 30,
      "assignedTo": "👩 Sarah (You)",
    },
    {
      "id": 2,
      "name": "Omega 3",
      "dosage": "1000 mg",
      "frequency": "With lunch",
      "nextDose": "12:00 PM",
      "color": Colors.orange,
      "taken": false,
      "timesTaken": 28,
      "totalDoses": 30,
      "assignedTo": "👩 Sarah (You)",
    },
    {
      "id": 3,
      "name": "Melatonin",
      "dosage": "3 mg",
      "frequency": "Before bed",
      "nextDose": "9:00 PM",
      "color": Colors.purple,
      "taken": false,
      "timesTaken": 20,
      "totalDoses": 30,
      "assignedTo": "👨 Mike",
    },
    {
      "id": 4,
      "name": "Probiotics",
      "dosage": "50B CFU",
      "frequency": "With breakfast",
      "nextDose": "Tomorrow 8:00 AM",
      "color": Colors.green,
      "taken": true,
      "timesTaken": 12,
      "totalDoses": 30,
      "assignedTo": "👵 Mom",
    },
  ];

  List<Map<String, String>> filters = [
    {"id": "all", "label": "All"},
    {"id": "pending", "label": "Pending"},
    {"id": "taken", "label": "Taken"},
  ];

  List<Map<String, dynamic>> get filteredMeds {
    if (selectedFilter == "pending") {
      return medications.where((m) => m["taken"] == false).toList();
    }
    if (selectedFilter == "taken") {
      return medications.where((m) => m["taken"] == true).toList();
    }
    return medications;
  }

  void takePill(int id) {
    setState(() {
      for (var m in medications) {
        if (m["id"] == id) {
          m["taken"] = true;
          m["timesTaken"] = (m["timesTaken"] as int) + 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.healthyPurple,
        onPressed: () {
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.healthyPink, AppColors.healthyPurple],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 24),
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
                          "Pill Reminders",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Stay on track with your medications",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Stats Row
                Row(
                  children: [
                    Expanded(
                      child: CardWidget(
                        backgroundColor: Colors.white.withOpacity(0.15),
                        border: Border.all(color: Colors.white30),
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              "${medications.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Total Meds",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: CardWidget(
                        backgroundColor: Colors.white.withOpacity(0.15),
                        border: Border.all(color: Colors.white30),
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              "${medications.where((m) => m["taken"] == false).length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Pending",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),
                    
                    Expanded(
                      child: CardWidget(
                        backgroundColor: Colors.white.withOpacity(0.15),
                        border: Border.all(color: Colors.white30),
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.all(12),
                        child: const Column(
                          children: [
                            Text(
                              "92%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Adherence",
                              style: TextStyle(color: Colors.white70),
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

          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: filters
                          .map(
                            (f) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4,),
                                child: PrimaryButton(
                                  text: f["label"]!,
                                  onPressed: () {
                                    setState(() {
                                      selectedFilter = f["id"]!;
                                    });
                                  },
                                  color: selectedFilter == f["id"]
                                      ? AppColors.healthyPurple
                                      : Colors.white,
                                  textColor: selectedFilter == f["id"]
                                      ? Colors.white
                                      : Colors.black,
                                  height: 40,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),

                    // Medications List
                    Column(
                      children: filteredMeds.map((med) {
                        double progress =
                            (med["timesTaken"] / med["totalDoses"]) * 100;

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: med["color"]
                                              .withOpacity(0.2),
                                          child: Icon(
                                            Icons.medication,
                                            color: med["color"],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  med["name"],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                if (med["taken"] == true)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                          left: 6,
                                                        ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 6,
                                                          vertical: 2,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green[50],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check,
                                                          size: 14,
                                                          color: Colors.green,
                                                        ),
                                                        SizedBox(width: 2),
                                                        Text(
                                                          "Taken",
                                                          style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              "${med["dosage"]} • ${med["frequency"]}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "Assigned to ${med["assignedTo"]}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                      },
                                      icon: const Icon(Icons.more_vert),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),

                                // Bottom Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          med["nextDose"],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          "${med["timesTaken"]}/${med["totalDoses"]} doses",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (med["taken"] == false)
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.healthyPurple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                        ),
                                        onPressed: () {
                                          takePill(med["id"]);
                                        },
                                        child: const Text(
                                          "Take Now",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),

                                LinearProgressIndicator(
                                  value: progress / 100,
                                  backgroundColor: Colors.grey[300],
                                  color: med["color"],
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
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
