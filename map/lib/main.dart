import 'package:flutter/material.dart';
import 'pages/home.dart';

import 'pages/maps.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 4 Page App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
     HomePage(),
    
     OpenStreetMapScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color.fromARGB(202, 38, 0, 255),
        foregroundColor: Colors.black,
        title: const Text(""),
        centerTitle:  true,
        actions: [
          IconButton(
            onPressed: (){},
            icon : const Icon( Icons.settings_rounded),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
         
          BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'maps'),
          
        ],
      ),
    );
  }
}
