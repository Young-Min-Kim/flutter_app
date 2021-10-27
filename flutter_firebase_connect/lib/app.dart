import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {

          // Check for errors
          //로드가 실패되었을 때 -> 적절한 안내문구를 띄우기
          if (snapshot.hasError) {
            return Center(
              child: Text('firebase init failed'),
            );
          }

          // Once complete, show your application
          //Initialize가 정상적으로 실행 되었을 때
          if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          // 로딩 처리 부분
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
