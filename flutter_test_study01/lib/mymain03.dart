import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myapptest03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'solocoding',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: const MyAppTest03(),
    );
  }
}
