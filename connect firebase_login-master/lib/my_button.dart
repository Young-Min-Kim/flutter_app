import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({this.image, this.text, this.color, this.radius, this.onPressed});

  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        //spaceEvenly: 요소들을 균등하게 배치하는 속성
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          text,
          Opacity(
            opacity: 0.0,
            child: Image.asset('images/glogo.png'),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        //shadowColor: Colors.black, 그림자 추가하는 속성

        minimumSize: Size.fromHeight(50), // 높이만 50으로 설정
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            // shape : 버튼의 모양을 디자인 하는 기능
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
