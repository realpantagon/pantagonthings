import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pantagonthings/pages/ItemList.dart';
import 'package:pantagonthings/repository/airtable_repository.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<AirtableRecord> _records = [];
  int _totalCount = 0;
  double _totalNet = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final service = AirtableService(
      baseId: 'appUTL1IglUyPejRu',
      tableName: 'List',
      apiKey:
          'patAISgcZTgxiBMYV.56a388e5a648983751a2681138c78f884284fc54a004033211487631fa2f077c',
    );
    final records = await service.fetchRecords();
    setState(() {
      _records = records;
      _totalCount = records.length;
      _totalNet = records.fold(0.0, (sum, record) => sum + record.net);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text("Home Page"),
          ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            "All Items ($_totalCount)",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: Text(
                            "Amount (\$$_totalNet)",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: _handleAdd,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Add item",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 54, 54, 54),
              ),
            ),
            Expanded(
              child: ItemList(records: _records),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAdd() {
    log("Add button clicked");
  }
}

void main() {
  runApp(MaterialApp(
    home: Mainpage(),
  ));
}
