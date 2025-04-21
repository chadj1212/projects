import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<double> stopTimes; // List of recorded times

  // Constructor to receive data
  HistoryScreen({required this.stopTimes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recorded Times")),
      body: Center(
        child: stopTimes.isEmpty
            ? Text("No recorded times yet", style: TextStyle(fontSize: 18))
            : ListView.builder(
                itemCount: stopTimes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "Attempt ${index + 1}: ${stopTimes[index].toStringAsFixed(2)}s",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
