import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'src/home.dart';
import 'src/pages/named/first.dart';
import 'src/pages/named/second.dart';
import 'src/pages/next.dart';
import 'src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),

      // 기존 라우트 방식
      //initialRoute: "/",
      // routes: {
      //   "/" : (context)=> const Home(),
      //   "/first": (context) => const FirstNamedPage(),
      //   "/second": (context) => const SecondNamedPage(),
      // },

      //GetX 방식 -> 배열로 관리를 한다.
      //Transition ->페이지 애니메이션 처리
      getPages: [
        GetPage(
            name: "/",
            page: () => const Home(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/first",
            page: () => const FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => const SecondNamedPage(),
            transition: Transition.cupertino),
        GetPage(
            name: "/next",
            page: () => const NextPage(),
            transition: Transition.cupertino),
        GetPage(
            name: "/user/:uid",
            page: () => const UserPage(),
            transition: Transition.cupertino),
      ],
    );
  }
}
