import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package

class Expiration extends StatefulWidget {
  const Expiration({Key? key}) : super(key: key);

  @override
  _ExpirationState createState() => _ExpirationState();
}

class _ExpirationState extends State<Expiration> {
  // Static list to persist items across page navigation
  static final List<Map<String, dynamic>> _items = [];

  void _addItem() {
    String name = '';
    DateTime? purchaseDate;
    DateTime? expiryDate;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextButton(
                onPressed: () async {
                  purchaseDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
                child: const Text('Select Purchase Date'),
              ),
              TextButton(
                onPressed: () async {
                  expiryDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
                child: const Text('Select Expiry Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty &&
                    purchaseDate != null &&
                    expiryDate != null) {
                  setState(() {
                    _items.add({
                      'name': name,
                      'purchaseDate': purchaseDate,
                      'expiryDate': expiryDate,
                    });
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(int index) {
    String name = _items[index]['name'];
    DateTime? purchaseDate = _items[index]['purchaseDate'];
    DateTime? expiryDate = _items[index]['expiryDate'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: TextEditingController(text: name),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextButton(
                onPressed: () async {
                  purchaseDate = await showDatePicker(
                    context: context,
                    initialDate: purchaseDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
                child: const Text('Select Purchase Date'),
              ),
              TextButton(
                onPressed: () async {
                  expiryDate = await showDatePicker(
                    context: context,
                    initialDate: expiryDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
                child: const Text('Select Expiry Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty &&
                    purchaseDate != null &&
                    expiryDate != null) {
                  setState(() {
                    _items[index] = {
                      'name': name,
                      'purchaseDate': purchaseDate,
                      'expiryDate': expiryDate,
                    };
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B6F47), // Earth Brown
        title: const Text('Expiration',
            style: TextStyle(color: Colors.black)), // Black text color
        actions: [
          IconButton(
            icon:
                const Icon(Icons.add, color: Colors.black), // Black text color
            onPressed: _addItem,
          ),
        ],
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'No items added yet.',
                style: TextStyle(color: Colors.black), // Black text color
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final purchaseDate =
                    DateFormat('dd/MM/yy').format(item['purchaseDate']);
                final expiryDate =
                    DateFormat('dd/MM/yy').format(item['expiryDate']);
                return ListTile(
                  tileColor: Color(0xFFF5F0E6), // Beige / Sand
                  title: Text(
                    item['name'],
                    style: TextStyle(color: Colors.black), // Black text color
                  ),
                  subtitle: Text(
                    'Purchase: $purchaseDate, Expiry: $expiryDate',
                    style: TextStyle(color: Colors.black), // Black text color
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: Color(0xFF6B8E23)), // Olive Green
                        onPressed: () => _editItem(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Color(0xFFD88C6D)), // Terracotta
                        onPressed: () => _deleteItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
