import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile_ui_design/appstate.dart';
import 'package:profile_ui_design/home.dart';
import 'package:profile_ui_design/messages.dart';
import 'package:profile_ui_design/likes.dart';
import 'package:profile_ui_design/profile.dart';
import 'package:profile_ui_design/create.dart';
import 'package:profile_ui_design/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppState(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generationz',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: AnimatedSplashScreenWidget(),
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int selectedIndex = 3;
  String? selectedName;
  Image? selectedImage;

  final List<String> _titles = [
    "Home",
    "Likes",
    "Messages",
    "Profile",
  ];

  void openChat(String name, Image image) {
    setState(() {
      selectedName = name;
      selectedImage = image;
      selectedIndex = 2; // Switch to Messages page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorz().deepTaupe,
        foregroundColor: Colorz().softBeige,
        title: Text(_titles[selectedIndex]),
        centerTitle: true,
      ),
      body: [
        HomePage(),
        LikesPage(openChat: openChat),
        MessagesPage(image: selectedImage, name: selectedName),
        const CreateProfile()
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colorz().mutedGold,
        backgroundColor: Colorz().deepTaupe,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.heart_fill),
            label: "Likes",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "Messages",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
