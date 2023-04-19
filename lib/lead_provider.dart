import 'package:flutter/foundation.dart';
import 'MyModel.dart';
import 'api_service.dart';

class LeadProvider with ChangeNotifier {
  ApiService _apiService = ApiService();
  List<Lead> _leads = [];

  List<Lead> get leads => _leads;

  fetchLeads() async {
    _leads = await _apiService.fetchLeads();
    notifyListeners();
  }
}
