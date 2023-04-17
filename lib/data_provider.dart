import 'dart:io';

import 'package:flutter/foundation.dart'; // Import the foundation.dart package
import 'package:csv/csv.dart'; // Import the csv.dart package

import 'package:path_provider/path_provider.dart';
import 'package:untitled/MyModel.dart'; // Import the path_provider.dart package

class DataProvider extends ChangeNotifier {
  // Extend with ChangeNotifier
  // Convert data to CSV and save the file
  Future<String> exportDataToCSV(List<MyModel> data) async {
    List<List<String>> csvData = [
      [
        'Lead ID',
        'First Name',
        'Last Name',
        'Email',
        'Event Name',
        'Job Title',
        'Company',
        'Profile',
        'Sector Name',
        'Job Function Name',
        'Notes'
      ]
    ];

    data.forEach((element) {
      csvData.add([
        element.leadId.toString(),
        element.firstName,
        element.lastName,
        element.email,
        element.eventName,
        element.jobTitle,
        element.company,
        element.profile,
        element.sectorName,
        element.jobFunctionName,
        element.notes,
      ]);
    });

    String csv = const ListToCsvConverter().convert(csvData);

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path + '/data_export.csv';
    await File(path).writeAsString(csv);

    return path;
  }

  // Load sample data
  List<MyModel> loadData() {
    return [
      MyModel(
          leadId: 1,
          firstName: 'Alice',
          lastName: 'Smith',
          email: 'alice.smith@example.com',
          eventName: 'Tech Conference',
          jobTitle: 'Software Engineer',
          company: 'Tech Corp',
          profile: 'Experienced developer',
          sectorName: 'IT',
          jobFunctionName: 'Development',
          notes: 'Enthusiastic about new technologies'),

      // Add more sample data if needed
      MyModel(
          leadId: 2,
          firstName: 'Tamoor',
          lastName: 'Munawar',
          email: 'alice.smith@example.com',
          eventName: 'Tech Conference',
          jobTitle: 'Software Engineer',
          company: 'Tech Corp',
          profile: 'Experienced developer',
          sectorName: 'IT',
          jobFunctionName: 'Development',
          notes: 'Enthusiastic about new technologies'),
    ];
  }
}
