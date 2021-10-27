import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_genam_getx/src/controller/count_controller_with_provider.dart';
import 'package:flutter_genam_getx/src/home.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'state/with_getx.dart';
import 'state/with_provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //GetXController 선언 -> 이제 어디서든 쓸 수 있다.
    Get.put(CountControllerWithGetx());

    return Scaffold(
        appBar: AppBar(
          title: const Text('단순 상태 관리'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                child: WithGetX(),
              ),
              // Expanded(
              //   child: WithProvider(),
              // ),
              // Expanded(
              //   child: ChangeNotifierProvider<CountControllerWithProvider>(
              //     create: (_) => CountControllerWithProvider(),
              //     child: WithProvider(),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
