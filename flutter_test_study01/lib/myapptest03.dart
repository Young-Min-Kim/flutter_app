import 'package:flutter/material.dart';

class MyAppTest03 extends StatefulWidget {
  const MyAppTest03({Key? key}) : super(key: key);

  @override
  _MyAppTest03State createState() => _MyAppTest03State();
}

class _MyAppTest03State extends State<MyAppTest03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('just Text'),
              ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('just Text'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('just Text'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('just Text'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('just Text'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('just Text'),
            ),
          ],
        ),
      ),
    );
  }
}
