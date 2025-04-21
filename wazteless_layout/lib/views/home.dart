import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:wazteless_layout/models/posts.dart';
import 'package:wazteless_layout/services/remote_services.dart';
import 'package:wazteless_layout/views/articles.dart';
import 'package:wazteless_layout/views/brands.dart';
import 'package:wazteless_layout/views/agridatapage.dart';
import 'package:wazteless_layout/views/wikirate.dart';
import 'package:wazteless_layout/views/expiration.dart';
import 'geolocation.dart';
import 'barcode.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildTile(BuildContext context, String title, Widget? page) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: page != null
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
                    );
                  }
                : null,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isHovered
                    ? Color(0xFF6B8E23)
                    : Color(0xFFD2B48C), // Olive Green / Tan
                borderRadius: BorderRadius.circular(10),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.6 * 255).toInt()),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontSize: 16), // Black text color
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B6F47), // Earth Brown
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.black), // Black text color
            SizedBox(width: 10),
            Text('Home',
                style: TextStyle(color: Colors.black)), // Black text color
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: [
          _buildTile(context, 'Discover', OpenStreetMapScreen()),
          _buildTile(context, 'Scanner', BarcodeView()),
          _buildTile(context, 'Brands', WikiratePage()),
          _buildTile(context, 'Expiration', Expiration()),
          _buildTile(context, 'Articles', ArticlesPage()),
          _buildTile(context, 'AgriData', AgriDataPage()),
        ],
      ),
    );
  }
}
