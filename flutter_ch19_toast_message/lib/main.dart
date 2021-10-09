import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snack Bar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Toast'),
          onPressed: () {
            flutterToast();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.red), //ElevatedButton 에서 버튼 색 바꾸기
          ),
        ),
      ),
    );
  }
}

void flutterToast() {
  // 토스트 메시지를 출력하기 위한 함수 생성
  Fluttertoast.showToast(
      msg: 'Flutter 토스트 메시지', // 토스트 메시지 내용
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent, // 배경색 빨강색
      fontSize: 20.0,
      textColor: Colors.white, // 폰트 하얀색
      toastLength: Toast.LENGTH_SHORT // 토스트 메시지 지속시간 짧게
      );
}
