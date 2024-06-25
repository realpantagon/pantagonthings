// airtable_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pantagonthings/response/airtable_record_response.dart';

class AirtableService {
  final String baseId;
  final String tableName;
  final String apiKey;

  AirtableService({
    required this.baseId,
    required this.tableName,
    required this.apiKey,
  });

  Future<List<AirtableRecord>> fetchRecords() async {
    final url = 'https://api.airtable.com/v0/$baseId/$tableName';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final records = (data['records'] as List)
          .map((record) => AirtableRecord.fromJson(record))
          .toList();
      return records;
    } else {
      throw Exception('Failed to load records');
    }
  }

  Future<List<AirtableRecord>> fetchFavoriteRecords() async {
    final url = 'https://api.airtable.com/v0/$baseId/$tableName?view=favorite';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final records = (data['records'] as List)
          .map((record) => AirtableRecord.fromJson(record))
          .toList();
      return records;
    } else {
      throw Exception('Failed to load favorite records');
    }
  }
}
