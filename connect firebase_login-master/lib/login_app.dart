import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin2/my_button.dart';


class LogInRefactoring extends StatelessWidget {
  const LogInRefactoring({ Key key }) : super(key: key);

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
      body: _buildButton(),
    );
  }

  // _buildButton 의 _ 는 private 접근 제어자이다. 같은 파일내에서만 참조가능하도록 한다.
  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //리팩토링을 통한 버튼 클래스를 간단하게 구현해 원하는 만큼 버튼 생성하기
          MyButton(
            image: Image.asset('images/glogo.png'),
            text: Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

            },
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
    );
  }
}