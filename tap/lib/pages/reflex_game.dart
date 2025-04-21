import 'package:flutter/material.dart';
import 'package:tap/pages/timer.dart';
import 'test.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('tap reflex'),
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'REFLEX',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),
          ),

         Expanded(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Spacer(flex: 2), // Adjust this flex value to control height
      SizedBox(
        width: 200,
        child: ElevatedButton(
          onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  TimerScreen()),
  );
},
          child: const Text('Start Game'),
        ),
      ),
      const SizedBox(height: 20),
     
      Spacer(flex: 3), // Pushes buttons slightly upward
    ],
  ),
),

        ],
      ),
    );
  }
}