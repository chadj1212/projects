import 'package:flutter/material.dart';
import 'package:wazteless_layout/models/agrifood.dart';
import 'package:wazteless_layout/services/remote_services.dart';

class AgriDataPage extends StatefulWidget {
  const AgriDataPage({Key? key}) : super(key: key);

  @override
  _AgriDataPageState createState() => _AgriDataPageState();
}

class _AgriDataPageState extends State<AgriDataPage> {
  List<AgriFood>? agriFoodData;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      agriFoodData = await AgriFoodService().fetchAgriFoodData();
      if (agriFoodData != null) {
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.agriculture),
            SizedBox(width: 10),
            Text('Agri Data'),
          ],
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: agriFoodData?.length ?? 0,
          itemBuilder: (context, index) {
            final item = agriFoodData?[index];
            if (item == null) {
              return const SizedBox(); // Skip rendering if the item is null
            }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgriFoodDetailPage(agriFood: item),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.memberStateName?.name ?? "N/A"} - ${item.category?.name ?? "N/A"}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Begin Date: ${item.beginDate?.name ?? "N/A"}'),
                    Text('End Date: ${item.endDate?.name ?? "N/A"}'),
                    Text('Price: €${item.price ?? "N/A"}'),
                    Text('Unit: ${item.unit?.name ?? "N/A"}'),
                    Text('Week Number: ${item.weekNumber ?? "N/A"}'),
                    Text('Product Code: ${item.productCode ?? "N/A"}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AgriFoodDetailPage extends StatelessWidget {
  final AgriFood agriFood;

  const AgriFoodDetailPage({Key? key, required this.agriFood})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${agriFood.memberStateName?.name ?? "N/A"} - ${agriFood.category?.name ?? "N/A"}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Member State Code: ${agriFood.memberStateCode?.name ?? "N/A"}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
                'Member State Name: ${agriFood.memberStateName?.name ?? "N/A"}'),
            Text('Begin Date: ${agriFood.beginDate?.name ?? "N/A"}'),
            Text('End Date: ${agriFood.endDate?.name ?? "N/A"}'),
            Text('Price: €${agriFood.price ?? "N/A"}'),
            Text('Unit: ${agriFood.unit?.name ?? "N/A"}'),
            Text('Week Number: ${agriFood.weekNumber ?? "N/A"}'),
            Text('Category: ${agriFood.category?.name ?? "N/A"}'),
            Text('Product Code: ${agriFood.productCode ?? "N/A"}'),
          ],
        ),
      ),
    );
  }
}
