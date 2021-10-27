import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/pages/normal/second.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Named Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/second");

                  // 현재 자신의 페이지는 지우면서 해당 페이지로 이동하기
                  //Get.offNamed("/second"); 
                },
                child: const Text("다음 Named 페이지 이동"),
              ),
            ],
          ),
        ));
  }
}
