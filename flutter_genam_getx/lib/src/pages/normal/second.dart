import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/home.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 기존 소스
                  //Navigator.of(context).pop();

                  //GetX 코드 -> context를 넘겨줘야 하는 부담감이 없다.
                  Get.back();
                },
                child: const Text("뒤로 이동"),
              ),
              ElevatedButton(
                onPressed: () {
                  // 기존 소스
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (_) => const Home()),
                  //     (route) => false);

                  //GetX 코드
                  //Get.to(const Home());
                  Get.offAll(() => const Home()); // Home으로 이동하면서 지금까지 지나간 페이지들을 모두 지우고 Home으로 이동
                },
                child: const Text("홈으로 이동"),
              )
            ],
          ),
        ));
  }
}
