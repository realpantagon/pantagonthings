// airtable_record.dart
class AirtableRecord {
  final String id;
  final String brand;
  final int itemId;
  final List<String> type;
  final String buyFrom;
  final String favorite;
  final String price;
  final double net;
  final String warrantyTime;
  final String discount;
  final String name;
  final String created;

  AirtableRecord({
    required this.id,
    required this.brand,
    required this.itemId,
    required this.type,
    required this.buyFrom,
    required this.favorite,
    required this.price,
    required this.net,
    required this.warrantyTime,
    required this.discount,
    required this.name,
    required this.created,
  });

  factory AirtableRecord.fromJson(Map<String, dynamic> json) {
    return AirtableRecord(
      id: json['id'],
      brand: json['fields']['Brand'] ?? '',
      itemId: json['fields']['ID'],
      type: List<String>.from(json['fields']['Type']),
      buyFrom: json['fields']['Buy From'] ?? '',
      favorite: json['fields']['Favorite'] ?? '',
      price: json['fields']['Price'] ?? '',
      net: (json['fields']['Net'] is int)
          ? (json['fields']['Net'] as int).toDouble()
          : double.tryParse(json['fields']['Net'].toString()) ?? 0.0,
      warrantyTime: json['fields']['Warranty Time'] ?? '',
      discount: json['fields']['Discount'] ?? '',
      name: json['fields']['Name'] ?? '',
      created: json['fields']['Created'] ?? '',
    );
  }
}
