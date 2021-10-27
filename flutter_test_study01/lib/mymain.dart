import 'package:flutter/material.dart';
import 'package:flutter_test_study01/mytestapp.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'soloCoding',
      theme: ThemeData(
        primaryColor: Colors.white
        //primaryColor: Colors.black
      ),
      //const는 불변상수. bulid 메서드가 더이상 관여하지 않도록 설정하여 속도를 향상시키기 위함
      home: const MyTestApp(title: '보내주는 제목 이름',),
    );
  }
}

