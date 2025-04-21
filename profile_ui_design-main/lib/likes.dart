import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'messages.dart';

class LikesPage extends StatelessWidget {
final Function(String, Image) openChat;

  LikesPage({required this.openChat});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (var like in appState.likes)
              ListTile(
                onTap: () {
                  openChat(like["name"], like["image"]); // Pass name & image
                },
                leading: CircleAvatar(
                  backgroundImage: (like["image"] as Image).image,
                ),
                title: Text(like["name"]),
              ),
          ],
        ),
      ),
    );
  }
}
