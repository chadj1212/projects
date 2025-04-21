import 'package:flutter/material.dart';
import 'package:shake_detector/shake_detector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ShakeGesture Example')),
      body: Center(
        // The start.
        child: ShakeDetectWrap(
          enabled: true,
          onShake: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Shake!')),
            );
          },
          child: Text('s')        ),
		// The end.
      ),
    );
  }
}