import 'package:flutter/material.dart';
import 'package:wazteless_layout/views/wikirate.dart'; // Import WikirateDetails
import 'package:wazteless_layout/models/data.dart'; // Import Companies model
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class BarcodeView extends StatefulWidget {
  @override
  _BarcodeViewState createState() => _BarcodeViewState();
}

class _BarcodeViewState extends State<BarcodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode'),
        centerTitle: true,
        backgroundColor: Color(0xFF8B6F47), // Earth Brown
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Black border
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://d2v5oodgkvnw88.cloudfront.net/uploads_production/image/data/10073/large_3800020415436.jpg?v=1536051366',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final String response =
                        await rootBundle.loadString('lib/models/data.json');
                    final List<dynamic> jsonData = json.decode(response);
                    final List<Companies> companies = jsonData
                        .map((data) =>
                            Companies.fromJson(data as Map<String, dynamic>))
                        .toList();

                    // Find the Nestlé company
                    final nestleCompany = companies.firstWhere(
                        (company) => company.brandName == 'Nestlé',
                        orElse: () => throw Exception('Nestlé not found'));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WikirateDetails(company: nestleCompany),
                      ),
                    );
                  } catch (e) {
                    print('Error loading Nestlé data: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD2B48C), // Tan / Camel
                  foregroundColor: Colors.black, // Black text color
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                ),
                child: Text(
                  'Scan',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
