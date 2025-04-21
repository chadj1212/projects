import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  final List<double> leaderboardScores;

  const LeaderboardPage({super.key, required this.leaderboardScores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leaderboard")),
      body: ListView.builder(
        itemCount: leaderboardScores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Player ${index + 1}",
              style: TextStyle(fontSize: 69),
            ),
            subtitle: Text(
              "Time: ${leaderboardScores[index].toStringAsFixed(1)}s",
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}