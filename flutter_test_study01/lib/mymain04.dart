import 'package:flutter/material.dart';

import 'mytestapp04.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'solocodingFlutter',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: const MyTestApp04(),
    );
  }
}
