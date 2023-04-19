import 'dart:convert';
import 'MyModel.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String apiUrl = 'http://etrack.simplelogix.com/hcpiapi/leads/get/all';

  Future<List<Lead>> fetchLeads() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Lead.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load leads');
    }
  }
}
