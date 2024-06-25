import 'package:flutter/material.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';

class ItemList extends StatelessWidget {
  final List<AirtableRecord> records;

  const ItemList({Key? key, required this.records}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 230, 230),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${record.name}'),
                Text('Brand: ${record.brand}'),
                // Text('Type: ${record.type}'),
                // Text('Buy From: ${record.buyFrom}'),
                // Text('Favorite: ${record.favorite}'),
                // Text('Price: ${record.price}'),
                Text('price: ${record.net}'),
                // Text('Warranty Time: ${record.warrantyTime}'),
                // Text('Discount: ${record.discount}'),
                // Text('Created: ${record.created}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
