import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'MyModel.dart';
import 'lead_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class LeadsScreen extends StatelessWidget {
  Future<void> _requestPermissions() async {
    await Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await _requestPermissions();
              if (await Permission.storage.isGranted) {
                await Provider.of<LeadProvider>(context, listen: false).fetchLeads();
                List<Lead> leads = Provider.of<LeadProvider>(context, listen: false).leads;
                String csvContent = 'leadId,firstName,lastName,email,eventName,jobTitle,company,profile,sectorName,jobFunctionName,notes\n';
                for (Lead lead in leads) {
                  List<String> leadData = [
                    lead.leadId.toString(),
                    lead.firstName ?? '',
                    lead.lastName ?? '',
                    lead.email ?? '',
                    lead.eventName ?? '',
                    lead.jobTitle ?? '',
                    lead.company ?? '',
                    lead.profile ?? '',
                    lead.sectorName ?? '',
                    lead.jobFunctionName ?? '',
                    lead.notes ?? '',
                  ];
                  csvContent += leadData.join(',') + '\n';
                }
                final directory = await getApplicationDocumentsDirectory();
                final path = directory.path;
                File file = File('$path/leads.csv');
                await file.writeAsString(csvContent);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('CSV file has been saved in the application documents directory.$path')),
                );
                OpenFile.open(file.path);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Storage permission is required to save and open the CSV file.')),
                );
              }
            },
            child: Text('Export Leads to CSV'),
          ),
        ],
      ),
    );
  }
}
