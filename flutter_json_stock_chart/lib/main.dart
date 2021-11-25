import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'stock.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

List yDataList = [];
List forcastDataList = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json Data Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStockApp(),
    );
  }
}

class MyStockApp extends StatelessWidget {
  const MyStockApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Forcast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('GET Json'),
              onPressed: () {
                getJson();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void getJson() async {


  //String url = "http://127.0.0.1:5000/stock";
  var response = await http.get(Uri.parse("http://10.0.2.2:5000/stock"));

  //print(response.body);

  var jsonData = response.body;
  double dataY = jsonDecode(jsonData)['0']['y_Close'];
  print(dataY);


  for (int i = 0; i < 20; i++) {
    if (jsonDecode(jsonData)['$i']['y_Close'] != null) {
      yDataList.add(jsonDecode(jsonData)['$i']['y_Close']);
    }
  }
  for (int i = 0; i < 20; i++) {
    if (jsonDecode(jsonData)['$i']['forcast_Close'] != null) {
      forcastDataList.add(jsonDecode(jsonData)['$i']['forcast_Close']);
    }
  }
  print('ddd =  $yDataList');
  print('ddd =  $forcastDataList');
}
