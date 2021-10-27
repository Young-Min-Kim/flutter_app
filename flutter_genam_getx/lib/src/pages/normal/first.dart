import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/pages/normal/second.dart';
import 'package:get/get.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 기존 소스
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => const FirstPage(),
                //   ),
                // );

                //GetX 코드 ->GetX 코드가 훨씬 간단하다. + 상태들을 로그로 잘 찍어준다.
                Get.to(() => const SecondPage());
              },
              child: const Text("다음 페이지 이동"),
            )
          ],
        ),
      )
    );
  }
}
