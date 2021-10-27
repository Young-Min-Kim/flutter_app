import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/home.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Next Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 전 페이지에서 arguments로 받아온 값 출력하기
              //Text("${Get.arguments}"), // 인자값 하나만 받았을때
              //Text("${Get.arguments['name']} 의 나이는 ${Get.arguments['age']} 입니다."),

              //class 객체로 받은 값 출력하기
              Text("${(Get.arguments as User).name} : ${(Get.arguments as User).age}"),

              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("뒤로 이동"),
              ),
            ],
          ),
        ));
  }
}
