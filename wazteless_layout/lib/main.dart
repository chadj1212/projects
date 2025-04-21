import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:wazteless_layout/views/articles.dart';
import 'package:wazteless_layout/views/home.dart';
import 'package:wazteless_layout/views/expiration.dart';
import 'package:wazteless_layout/views/geolocation.dart';
import 'package:wazteless_layout/views/brands.dart';
import 'package:wazteless_layout/views/agridatapage.dart';
import 'package:wazteless_layout/views/wikirate.dart';
import 'package:wazteless_layout/views/barcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Screen',
      theme: ThemeData(
        primaryColor: Color(0xFFF5F0E6), // Beige / Sand
        scaffoldBackgroundColor: Color(0xFFF5F0E6), // Beige / Sand
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black, // Black text color
                displayColor: Colors.black, // Black text color
              ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF8B6F47), // Earth Brown
          titleTextStyle: TextStyle(
            color: Colors.black, // Black text color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black), // Black text color
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFD2B48C), // Tan / Camel
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFD2B48C), // Tan / Camel
            foregroundColor: Color(0xFFF5F0E6), // Beige / Sand
          ),
        ),
        cardColor: Color(0xFFF5F0E6), // Beige / Sand
        dividerColor: Color(0xFFC5D1B6), // Sage Green
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFD88C6D), // Terracotta
        ),
      ),
      home: const RootApp(),
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ArticlesPage(),
    BarcodeView(),
    Expiration(),
    OpenStreetMapScreen(),
    WikiratePage(),
    AgriDataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFFF5F0E6), // Beige / Sand
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.home,
                color: Color(0xFF8B6F47)), // Earth Brown
            selectedIcon: Icon(CupertinoIcons.home,
                color: Color(0xFF6B8E23)), // Olive Green
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.text_bubble,
                color: Color(0xFF8B6F47)), // Earth Brown
            selectedIcon: Icon(CupertinoIcons.text_bubble,
                color: Color(0xFF6B8E23)), // Olive Green
            label: "Articles",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.barcode,
                color: Color(0xFF8B6F47)), // Earth Brown
            selectedIcon: Icon(CupertinoIcons.barcode,
                color: Color(0xFF6B8E23)), // Olive Green
            label: "Scanner",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.book,
                color: Color(0xFF8B6F47)), // Earth Brown
            selectedIcon: Icon(CupertinoIcons.book,
                color: Color(0xFF6B8E23)), // Olive Green
            label: "Expiration",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.map,
                color: Color(0xFF8B6F47)), // Earth Brown
            selectedIcon: Icon(CupertinoIcons.map,
                color: Color(0xFF6B8E23)), // Olive Green
            label: "Discover",
          ),
        ],
        indicatorColor: Color(0xFFD2B48C), // Tan / Camel
      ),
    );
  }
}
