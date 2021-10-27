import 'package:flutter/material.dart';

class MyTestApp extends StatefulWidget {
  const MyTestApp({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyTestAppState createState() => _MyTestAppState();
}

class _MyTestAppState extends State<MyTestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
