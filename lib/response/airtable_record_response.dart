class AirtableRecord {
  final String id;
  final String brand;
  final int itemId;
  final String type;
  final String buyFrom;
  final String favorite;
  final String price;
  final String net;
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
      brand: json['fields']['Brand'],
      itemId: json['fields']['ID'],
      type: json['fields']['Type'],
      buyFrom: json['fields']['Buy From'],
      favorite: json['fields']['Favorite'],
      price: json['fields']['Price'],
      net: json['fields']['Net'],
      warrantyTime: json['fields']['Warranty Time'],
      discount: json['fields']['Discount'],
      name: json['fields']['Name'],
      created: json['fields']['Created'],
    );
  }
}
