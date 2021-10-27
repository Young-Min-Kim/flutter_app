import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flexible Test',
      home: MyAppTest06(),
    );
  }
}

class MyAppTest06 extends StatefulWidget {
  const MyAppTest06({Key? key}) : super(key: key);

  @override
  _MyAppTest06State createState() => _MyAppTest06State();
}

class _MyAppTest06State extends State<MyAppTest06> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.amber,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.white54,
                      child: Image.asset('images/fire.png'),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.white54,
                      child: Image.asset('images/fire.png'),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.white54,
                      child: Image.asset('images/fire.png'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.white54,
                      child: Image.asset('images/fire.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: ListView.separated(
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('row $index'),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
                color: Colors.cyan[400],
                child: ListView(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/sun.jpg'),
                        ),
                        title: Text('Sun'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/moon.jpg'),
                        ),
                        title: Text('Moon'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/stars.jpg'),
                        ),
                        title: Text('Star'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ).toList(),
                )),
          ),
        ],
      ),
    );
  }
}
