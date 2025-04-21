import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'leaderboard.dart'; 
import 'package:shake_detector/shake_detector.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:tap/main.dart';


class TimerScreenTest extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreenTest> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Create audio player instance
  bool running = false;
  String message = "SHAKE THE SCREEN TO START";
  Timer? timer;
  Timer? stopMessageTimer;
  int elapsedTime = 0;
  int timeBeforeStopMessage = 0;
  int stopMessageTime = 0;
  int timeBetweenStopMessageAndStop = 0;
  bool stopMessageAppeared = false;
  bool hasStopped = false; // Flag to prevent data recording after the first stop
  List<double> leaderboardScores = []; // List to store leaderboard scores

  Color getBackgroundColor() {
    if (running && !stopMessageAppeared) return Colors.green[300]!;
    if (running && stopMessageAppeared) return Colors.yellow[300]!;
    if (!running && !stopMessageAppeared) return Colors.red[300]!;
    if (!running && stopMessageAppeared) return Colors.blue[300]!;
    return Colors.grey[200]!;
  }
  void _playSound() async {
    await _audioPlayer.play(AssetSource('oof.mp3')); // Ensure the file exists in assets
  }

  void startTimer() {
    if (running) return;
    setState(() {
      running = true;
      elapsedTime = 0;
      timeBeforeStopMessage = 0;
      timeBetweenStopMessageAndStop = 0;
      stopMessageAppeared = false;
      message = "Timer is running... time the tap.";
      hasStopped = false; // Reset the stop flag when a new timer starts
    });

    updateElapsedTime();
    scheduleStopMessage();
  }

  void scheduleStopMessage() {
  stopMessageTimer?.cancel();
  int randomStopTime = Random().nextInt(9000) + 3000; // Between 3s and 12s
  stopMessageTimer = Timer(Duration(milliseconds: randomStopTime), () {
    if (running) {
      setState(() {
        message = "Time to stop! Tap the screen.";
        stopMessageAppeared = true;
        stopMessageTime = elapsedTime; // Capture the time when the stop message appears
      });
    }
    scheduleStopMessage(); // Schedule another random stop message
  });
}

  void updateElapsedTime() {
    Timer.periodic(Duration(milliseconds: 100), (t) {
      if (!running) {
        t.cancel();
      } else {
        setState(() {
          elapsedTime += 100;
          timeBeforeStopMessage = elapsedTime;
        });
      }
    });
  }

  void stopTimer() {
  if (hasStopped) return; // Prevent stopping the timer and recording again after it has stopped
  setState(() {
    running = false;
    hasStopped = true; // Mark that the timer has stopped
    if (!stopMessageAppeared) {
      message = "You stopped too early! Wait for the stop message.";
    } else {
      message = "Timer stopped!";
      if (stopMessageTime > 0) {
        timeBetweenStopMessageAndStop = elapsedTime - stopMessageTime;
      }
    }
  });
  _playSound();


    // Save the score to the leaderboard if it's the first stop
    if (timeBetweenStopMessageAndStop > 0) {
      leaderboardScores.add(timeBetweenStopMessageAndStop / 1000.0); // Store in seconds
      leaderboardScores.sort(); // Optional: Sort leaderboard scores
    }

    timer?.cancel();
    stopMessageTimer?.cancel();
  }

  void navigateToLeaderboard() {
    // Navigate to the leaderboard page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaderboardPage(leaderboardScores: leaderboardScores),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    stopMessageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: stopTimer, 
      child: Scaffold(
        backgroundColor: getBackgroundColor(),
        appBar: AppBar(title: Text("Random Timer")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShakeDetectWrap(
                enabled: true,
                onShake: (){
                  if (!running){
                    startTimer();
                  }
                  _playSound();
                  
                  
                  },
                
                child: Text("") ),





              // ElevatedButton(
              //   onPressed: running ? null : startTimer,
              //   child: Text("Start Timer"),
              // ),


              SizedBox(height: 20),
              Text(message, style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Elapsed Time: ${(elapsedTime / 1000).toStringAsFixed(1)}s", 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              if (timeBetweenStopMessageAndStop > 0) 
                Text("Time between stop message and stop: ${(timeBetweenStopMessageAndStop / 1000).toStringAsFixed(1)}s",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: leaderboardScores.isEmpty ? null : navigateToLeaderboard,
                child: Text("View Leaderboard"),
              ),
              SizedBox(
        width: 200,
        child: ElevatedButton(onPressed: _playSound,
          child: Text("Play Sound")



          
//           onPressed: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) =>  TapTapGame()),
//   );
// },
//           child: const Text('Start Game'),
        ),
      ),





            ],
          ),
        ),
      ),
    );
  }
}
