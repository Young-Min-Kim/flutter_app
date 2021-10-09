import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'second_file.dart';

void main() {
  runApp(MyApp());
}

// stateless �� Wid��et �� ��� ���� StatefulWidget�� Imutable ��Ư¡�� ����
class MyApp extends StatefulWidget {
  // createState() �޼���� �ݵ�� StateŸ���� ��ü�� �����ؾ� �Ѵ�.
  // �ᱹ <StatefulWidget> Ÿ�Ը��� �� �� �ִ� ��ü���� �Ѵ�.
  // �� ��ü�� �Ʒ��� MyAppState�� �ٰ��ؼ� ������� ���̴�.
  @override
  State<StatefulWidget> createState() {
    // createState() �޼���� StatefulWidget ������ �����ɶ����� ȣ��Ǵ� �޼����̴�.
    // TODO: implement createState
    return MyAppState();
  }
  //StatelessWidget�� build �޼��忡�� ������ ��ü�� �ٷ� ��ȯ������
  //StatefulWidget�� �� createState() �޼��忡�� ������ ��ü�� ��ȯ�Ѵٴ� ����
  //�߿��� ������ �� �ϳ��̴�.
}

// ��� MyAppState Ŭ������ mutable�� �Ӽ��� ����ϰ� ���� �̷��� Ŭ������
//�ΰ��� ���� ���̴�.
class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  void _incrementCounter() {
    setState(() {});
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    //setState �޼���� counter ������ ���ڰ� �����Կ� ����
                    //counter ������ ����ϴ� �������� ǥ�����ش�.
                    //counter�� ������ state�� ���߰� �� ��ȭ�� �ٽ�
                    //rebuild ����� �ϱ� �����̴�.
                    setState(() {
                      counter++;
                      print('$counter');
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                      print('$counter');
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => SecondPage()),
            //       );
            //     },
            //     child: Text(
            //       'New Page',
            //     ))
          ],
        ),
      ),
    );
  }
}
