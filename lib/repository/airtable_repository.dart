import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pantagonthings/response/airtable_record_response.dart';

class AirtableService {
  final String baseId;
  final String tableName;
  final String apiKey;

  AirtableService(
      {required this.baseId, required this.tableName, required this.apiKey});

  Future<List<AirtableRecord>> fetchRecords() async {
    final url =
        'https://api.airtable.com/v0/$baseId/$tableName?view=Grid%20view';
    final headers = {
      'Authorization': 'Bearer $apiKey',
    };

    try {
      log('Fetching data from: $url');
      final response = await http.get(Uri.parse(url), headers: headers);
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['records'];
        return data.map((json) => AirtableRecord.fromJson(json)).toList();
      } else {
        log('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Error fetching data: $e');
      return [];
    }
  }
}
