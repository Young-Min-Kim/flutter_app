import 'package:flutter/material.dart';
import 'package:flutter_genam_getx/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        // provider와 다르게 전달해야 할 context가 없다는 장점
        Get.find<CountControllerWithGetx>().increase();
      },
      child: const Text("+", style: TextStyle(fontSize: 30)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GetX", style: TextStyle(fontSize: 50)),
          GetBuilder<CountControllerWithGetx>(
            builder: (controller) {
              return Text("${controller.count}",
                  style: const TextStyle(fontSize: 50));
            },
          ),

          // GetX는 provider와 다르게 전달해야 할 context가 없다는 장점 
          // -> context 없이 별도의 다른 메서드로 따로 빼서 사용이 가능해짐
          _button(),
        ],
      ),
    );
  }
}
