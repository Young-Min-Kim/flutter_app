import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/home.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Named Page'),
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
                  Get.offAllNamed("/");
                },
                child: const Text("홈으로 이동"),
              )
            ],
          ),
        ));
  }
}
