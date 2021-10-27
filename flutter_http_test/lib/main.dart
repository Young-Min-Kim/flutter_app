import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/repo_data.dart';
import 'model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _aaa = "";

  Future<int> _getData() async {
    String url = "http://snaptag.co.kr/data/get?seq=4007";
    var response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    var a = json.decode(response.body);
    print(a);

    RepoDart repoDart = RepoDart.fromJson(a);

    Data jsonData = Data.fromJson(a);
    print("${jsonData.dataCsNumber}, ${jsonData.dataDownloadUrl}");

    _aaa = repoDart.data!.dataType!;

    return 1;
  }

  Future<String> _getUrl() async {
    String url = "http://snaptag.co.kr/data/get?seq=4007";
    var response = await http.get(Uri.parse(url));
    var responseBody = utf8.decode(response.bodyBytes);
    var result = User.fromJson(json.decode(responseBody));

    print("${result.dataName}, ${result.dataAlphaA}");

    return "result";
  }

  void _incrementCounter() {
    setState(() {
      _getData();
      _getUrl();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter $_aaa',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Dynamic {}
