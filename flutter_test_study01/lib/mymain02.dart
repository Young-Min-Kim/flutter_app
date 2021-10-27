import 'package:flutter/material.dart';

import 'mytestapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MyTestApp02(),
    );
  }
}

class MyTestApp02 extends StatelessWidget {
  const MyTestApp02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('text text text'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('aaa'),
                  SizedBox(width: 30,),
                  Text('bbb'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
