import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final Image? image;
  final String? name;
  final TextEditingController _textController = TextEditingController();

  MessagesPage({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        mainAxisAlignment: MainAxisAlignment.center,
      body: Column(
        children: [
          if (name != null)
            AppBar(leading: ClipOval(child: image), title: Text("$name")),
          Spacer(),
          if (name == null) AppBar(title: Text("")),
          if (image != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Send a message...",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                )
              ],
            ),
          if (image == null) Text(""),
        ],
      ),
    );
  }
}
