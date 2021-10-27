import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('GET'),
              onPressed: () {
                getUrl();
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              child: Text('POSt'),
              onPressed: () {
                postUrl();
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text('값 추가하기'),
              onPressed: () {
                addJson();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> getUrl() async {
  String url = "http://10.0.2.2:8080/";
  var response = await http.get(Uri.parse(url));
  var responseBody = utf8.decode(response.bodyBytes);

  var result = User.fromJson(json.decode(responseBody));

  print(result.age);
  print(result.name);

  return "result";
}

Future<String> postUrl() async {
  String url = "http://10.0.2.2:8080/";
  var response = await http.post(Uri.parse(url));
  var responseBody = utf8.decode(response.bodyBytes);

  var result = User.fromJson(json.decode(responseBody));

  print(result.age);
  print(result.name);

  return "result";
}

Future<int> addJson() async {
  String url = "http://10.0.2.2:8080/add/";

    final queryParameters = {
    'input': '안녕',
  };

  // var request = await http.post(Uri.parse(url, queryParameters) );

  final uri =
        Uri.http('10.0.2.2:8080', '/add/', queryParameters);
    final response = await http.post(uri);



  return 1;
}
