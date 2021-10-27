import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'second_file.dart';

void main() {
  runApp(MyApp());
}

// stateless 한 Widget 을 상속 받은 StatefulWidget은 Imutable 한특징을 유지
class MyApp extends StatefulWidget {
  // createState() 메서드는 반드시 State타입의 객체를 리턴해야 한다.
  // 결국 <StatefulWidget> 타입만이 올 수 있는 객체여야 한다.
  // 이 객체는 아래의 MyAppState에 근거해서 만들어진 것이다.
  @override
  State<StatefulWidget> createState() {
    // createState() 메서드는 StatefulWidget 위젯이 생성될때마다 호출되는 메서드이다.
    // TODO: implement createState
    return MyAppState();
  }
  //StatelessWidget은 build 메서드에서 생성한 객체를 바로 반환하지만
  //StatefulWidget은 이 createState() 메서드에서 생성한 객체를 반환한다는 것이
  //중요한 차이점 중 하나이다.
}

// 대신 MyAppState 클래스가 mutable한 속성을 대신하게 만들어서 이렇게 클래스를
//두개로 나눈 것이다.
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
                    //setState 메서드는 counter 변수의 숫자가 증가함에 따라서
                    //counter 변수를 사용하는 위젯들을 표시해준다.
                    //counter의 증가로 state가 변했고 이 변화를 다시
                    //rebuild 해줘야 하기 때문이다.
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
