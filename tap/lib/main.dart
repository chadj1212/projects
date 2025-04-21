import 'package:flutter/material.dart';
import 'pages/reflex_game.dart';
import 'pages/timer.dart';
import 'pages/test.dart';
import 'pages/leaderboard.dart';


void main() {
  runApp(TapTapGame());
}

class TapTapGame extends StatelessWidget {
  const TapTapGame({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap reflex',
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home:  MainMenu(),
    );
  }
}




// body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //     child:Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [

      //         Container(
      //           height: 100,
      //           width: 100,
      //           color: Colors.red,
      //           child: Center(child: const Text("hello")),


      //         ),
      //         Container(
                
      //           height: 100,
      //           width: 100,
      //           color: const Color.fromARGB(255, 41, 150, 74),
      //           child: Center(child: const Text("hello")),
                

      //         )

      //       ],
      //     )
      //   ),