import 'package:flutter/material.dart';
import 'package:wazteless_layout/models/data.dart'; // Import the DataItem model
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class WikiratePage extends StatefulWidget {
  @override
  _WikiratePageState createState() => _WikiratePageState();
}

class _WikiratePageState extends State<WikiratePage> {
  List<Companies>? _companies;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final String response =
          await rootBundle.loadString('lib/models/data.json');
      final List<dynamic> jsonData = json.decode(response);
      final List<Companies> companies = jsonData
          .map((data) => Companies.fromJson(data as Map<String, dynamic>))
          .toList();
      setState(() {
        _companies = companies;
      });
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B6F47), // Earth Brown
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.7)), // Black text color
          ),
          style: TextStyle(color: Colors.black), // Black text color
          onChanged: (value) {
            setState(() {
              _searchQuery = value.toLowerCase();
            });
          },
        ),
      ),
      body: _companies == null
          ? Center(
              child: CircularProgressIndicator(
                  color: Color(0xFF6B8E23))) // Olive Green
          : _companies!.isEmpty
              ? Center(
                  child: Text(
                    'No companies found.',
                    style: TextStyle(color: Colors.black), // Black text color
                  ),
                )
              : ListView.builder(
                  itemCount: _companies!.length,
                  itemBuilder: (context, index) {
                    final company = _companies![index];
                    final companyName = company.brandName?.toLowerCase() ?? '';

                    if (_searchQuery.isNotEmpty &&
                        !companyName.contains(_searchQuery)) {
                      return SizedBox.shrink();
                    }

                    return ListTile(
                      tileColor: Color(0xFFF5F0E6), // Beige / Sand
                      title: Text(
                        company.brandName ?? 'No Name',
                        style:
                            TextStyle(color: Colors.black), // Black text color
                      ),
                      subtitle: Text(
                        'ESG Score: ${company.esgScore ?? 'N/A'}\nESG Grade: ${company.esgGrade?.name ?? 'N/A'}',
                        style:
                            TextStyle(color: Colors.black), // Black text color
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFFD88C6D)), // Terracotta
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WikirateDetails(company: company),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}

class WikirateDetails extends StatelessWidget {
  final Companies company;

  const WikirateDetails({required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.brandName ?? 'No Name'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company.brandName ?? 'No Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Products: ${company.products?.join(", ") ?? 'N/A'}'),
            Text('ESG Score: ${company.esgScore ?? 'N/A'}'),
            Text('ESG Grade: ${company.esgGrade?.name ?? 'N/A'}'),
            SizedBox(height: 16),
            Text('Brand Info:'),
            Text(company.brandInfo ?? 'No information available.'),
            SizedBox(height: 16),
            Text('Recent ESG News:'),
            ...?company.recentEsgNews?.map((news) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title ?? 'No Title',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                          'Date: ${news.date?.toLocal().toString().split(' ')[0] ?? 'N/A'}'),
                      Text('Source: ${news.source ?? 'N/A'}'),
                      Text('Summary: ${news.summary ?? 'N/A'}'),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
