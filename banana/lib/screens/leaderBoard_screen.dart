import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/colors.dart';

class LeaderboardWidget extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboardData = [
    {"name": "Aryan", "score": 125},
    {"name": "Pawan", "score": 110},
    {"name": "Sita", "score": 100},
    {"name": "Ravi", "score": 95},
    {"name": "Aayush", "score": 80},
  ];

  LeaderboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "🏆 Leaderboard".text.make(),
        backgroundColor: AppColors.primaryColor,
      ),
      body: VStack(
        [
          20.heightBox,
          "Top Players".text.xl.bold.color(AppColors.primaryColor).makeCentered(),
          20.heightBox,
          Expanded(
            child: ListView.builder(
              itemCount: leaderboardData.length,
              itemBuilder: (context, index) {
                final player = leaderboardData[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Text(
                        "#${index + 1}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      player["name"],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      "${player["score"]} pts",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
