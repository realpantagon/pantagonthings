// item_list.dart
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';

class ItemList extends StatelessWidget {
  final List<AirtableRecord> records;
  final Future<void> Function() onRefresh;

  const ItemList({Key? key, required this.records, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GiffyDialog.image(
                      Image.network(
                        "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        record.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Brand: ${record.brand}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Type: ${record.type.join(", ")}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Buy From: ${record.buyFrom}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Favorite: ${record.favorite}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Price: ${record.price}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Total: ${record.total}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Warranty Time: ${record.warrantyTime}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Discount: ${record.discount}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Created: ${record.created}',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'CANCEL'),
                          child: const Text('CANCEL',
                              style: TextStyle(color: Colors.white)),
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.red),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK',
                              style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.green),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(record.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Brand: ${record.brand}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('Total: ${record.total}',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
