import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/pages/simple_state_manage_page.dart';

import 'package:get/get.dart';

import 'pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라우트 관리 홈'),
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
                Get.to(() => const FirstPage());
              },
              child: const Text("일반적인 라우트"),
            ),
            ElevatedButton(
              onPressed: () {
                // main 에서 선언한 getPages named 활용 ->toNamed()
                Get.toNamed("/first");
              },
              child: const Text("Named 라우트"),
            ),
            ElevatedButton(
              onPressed: () {
                //argument 활용하기
                //Get.toNamed("/next", arguments: "인자값 전달");

                //숫자 전달도 가능
                //Get.toNamed("/next", arguments: 3);

                //인자값 여러개를 배열로 감싸서 보내기 가능
                //Get.toNamed("/next", arguments: {"name": "김영민", "age": 26});
                Get.toNamed("/next", arguments: User(name: "김김영민", age: 22));
              },
              child: const Text("Arguments 전달"),
            ),

            //url 보내고받기
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/user/28357?name=김영민&age=26");
              },
              child: const Text("동적 url"),
            ),

            //GetX의 상태관리 기능
            ElevatedButton(
              onPressed: () {
                Get.to(const SimpleStateManagePage());
              },
              child: const Text("단순 상태 관리"),
            ),
          ],
        ),
      ),
    );
  }
}

//커스텀 하게 만든 객체도 argument로 전달이 가능하다.
class User {
  String? name;
  int? age;
  User({this.name, this.age});
}
