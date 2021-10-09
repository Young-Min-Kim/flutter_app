import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(builder: (context) {

        //GestureDetector부분은 키보드를 밖에 화면 눌렀을때 없애기 위해 감싸준 것
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(top: 50)), // 위에만 50정도 padding 값 주는 속성
                Center(
                  child: Image(
                    image: AssetImage('image/chef.gif'),
                    width: 170,
                    height: 190,
                  ),
                ),

                // text 필드로 어떤 정보를 입력받을때 사용되는 것이 Form 위젯
                Form(
                    child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15))),
                  child: Container(
                    // 컨테이너 위젯은 하나의 차일드밖에 가질 수 없으므로 여러개를 세로로 배치하기 위해 컬럼 위젯 추가
                    padding: EdgeInsets.all(40),
                    child: Column(children: [
                      TextField(
                        // 기본적으로 TextField 클래스 내에 controller가 내장되어 있다.
                        controller: controller,

                        autofocus: true,

                        decoration: InputDecoration(labelText: 'Eneter "dice"'),
                        keyboardType: TextInputType
                            .emailAddress, // 텍스트 입력할때 나오는 키보드 종류 선택
                      ),
                      TextField(
                        controller: controller2,
                        decoration:
                            InputDecoration(labelText: 'Eneter Password'),
                        keyboardType:
                            TextInputType.text, // 텍스트 입력할때 나오는 키보드 종류 선택
                        obscureText: true, // 비번 가리기 위한 설정
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.text == 'dice' &&
                              controller2.text == '1234') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Dice()));
                          } else if (controller.text == 'dice' &&
                              controller2.text != '1234') {
                            showSnackBar2(context);
                          } else if (controller.text != 'dice' &&
                              controller2.text == '1234') {
                            showSnackBar3(context);
                          } else {
                            showSnackBar(context);
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orangeAccent,
                            minimumSize: Size(120, 40),
                            shape: RoundedRectangleBorder(
                                // shape : 버튼의 모양을 디자인 하는 기능
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 0.0),
                      ),
                    ]),
                  ),
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("로그인 정보를 다시 확인하세요.")));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("로그인 정보를 다시 확인하세요."),
      duration: Duration(milliseconds: 300)));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("dice의 철자를 확인하세요"), duration: Duration(milliseconds: 300)));
}
