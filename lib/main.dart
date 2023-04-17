import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'MyModel.dart';
import 'data_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSV Exporter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<MyModel> data;

  @override
  void initState() {
    super.initState();
    data = Provider.of<DataProvider>(context, listen: false).loadData(

    );
  }

  Future<void> _exportData() async {
    if (await Permission.storage.request().isGranted) {
      String path = await Provider.of<DataProvider>(context, listen: false)
          .exportDataToCSV(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data exported to $path')));
      OpenFile.open(path);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Storage permission denied')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV Exporter'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${data[index].firstName} ${data[index].lastName}'),
            subtitle: Text('Company: ${data[index].company}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _exportData,
        tooltip: 'Export to CSV',
        child: Icon(Icons.file_download),
      ),
    );
  }
}
