import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Lead_view.dart';
import 'lead_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LeadProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Leads to CSV')),
        body: LeadsScreen(),
      ),
    );
  }
}
