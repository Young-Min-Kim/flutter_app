import 'package:flutter/material.dart';


class MyTestApp04 extends StatefulWidget {
  const MyTestApp04({ Key? key }) : super(key: key);

  @override
  _MyTestApp04State createState() => _MyTestApp04State();
}

class _MyTestApp04State extends State<MyTestApp04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('texttexttexttext'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, child: const Text('aaa')),
              ElevatedButton(onPressed: (){}, child: const Text('aaa')),
              ElevatedButton(onPressed: (){}, child: const Text('aaa')),
            ],
          ),
        ),
      ),
    );  }
}