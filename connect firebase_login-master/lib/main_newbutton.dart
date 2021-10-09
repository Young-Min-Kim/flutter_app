import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login app',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            ElevatedButton(
              onPressed: () {
                print('TextButton Button');
              },

              child: Row(
                //spaceEvenly: 요소들을 균등하게 배치하는 속성
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/glogo.png'),
                  Text('Login with Google',
                    style: TextStyle(color: Colors.black87, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/glogo.png'),
                  ),
                ],
              ), 
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                //shadowColor: Colors.black, 그림자 추가하는 속성

                minimumSize: Size.fromHeight(50), // 높이만 50으로 설정
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    // shape : 버튼의 모양을 디자인 하는 기능
                    borderRadius: BorderRadius.circular(4.0)),
                ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                print('TextButton Button');
              },
              child: Row(
                //spaceEvenly: 요소들을 균등하게 배치하는 속성
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/flogo.png'),
                  Text(
                    'Login with Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/glogo.png'),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF334D92),
                //shadowColor: Colors.black, 그림자 추가하는 속성

                minimumSize: Size.fromHeight(50), // 높이만 50으로 설정
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    // shape : 버튼의 모양을 디자인 하는 기능
                    borderRadius: BorderRadius.circular(4.0)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                print('TextButton Button');
              },
              child: Row(
                //spaceEvenly: 요소들을 균등하게 배치하는 속성
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  Text(
                    'Login with Email',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Icon(
                      Icons.mail,
                      //color: Colors.white,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                //shadowColor: Colors.black, 그림자 추가하는 속성

                minimumSize: Size.fromHeight(50), // 높이만 50으로 설정
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    // shape : 버튼의 모양을 디자인 하는 기능
                    borderRadius: BorderRadius.circular(4.0)),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
