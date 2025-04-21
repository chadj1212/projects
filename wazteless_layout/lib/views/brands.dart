import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  final List<Map<String, String>> _brands = [
    {'title': 'Brand 1', 'subtitle': 'Description 1'},
    {'title': 'Brand 2', 'subtitle': 'Description 2'},
    {'title': 'Brand 3', 'subtitle': 'Description 3'},
    {'title': 'Brand 4', 'subtitle': 'Description 4'},
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              _searchQuery = value.toLowerCase();
            });
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: _brands.length,
        itemBuilder: (context, index) {
          final brand = _brands[index];
          if (_searchQuery.isNotEmpty &&
              !brand['title']!.toLowerCase().contains(_searchQuery)) {
            return SizedBox.shrink();
          }
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.store),
            ),
            title: Text(brand['title']!),
            subtitle: Text(brand['subtitle']!),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrandDetails(
                    title: brand['title']!,
                    subtitle: brand['subtitle']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BrandDetails extends StatelessWidget {
  final String title;
  final String subtitle;

  const BrandDetails({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.store, size: 40),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.circle, size: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
