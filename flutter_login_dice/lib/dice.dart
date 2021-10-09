import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice Gage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //컬럼에서 중앙에 위치하도록 코드(세로 중앙) ㅣ
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center, //로우에서 중앙에 위치하도록 코드(가로 중앙) ㅡ
                children: [
                  //Image(image: AssetImage('image/dice1.png'),
                  //width: 300
                  //),
                  Expanded(child: Image.asset('image/dice$leftDice.png')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: Image.asset('image/dice$rightDice.png')),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                // 파일명의 숫자를 변수로 만든다면 추후에 이 변수를 랜덤하게 만드는 기능만 추가해서 이미지를 랜덤하게 출력 가능
                setState(() {
                  //.nextInt(6)은 0 부터 5까지 6개를 랜덤으로 돌리는 것이므로 + 1 을 해줘야 함
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                });

                showToast("Left dice: {$leftDice}, Right dice +: {$rightDice}");
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  minimumSize: Size(100, 60),
                  shape: RoundedRectangleBorder(
                      // shape : 버튼의 모양을 디자인 하는 기능
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 0.0),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
