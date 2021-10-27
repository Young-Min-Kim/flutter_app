import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    // 위와 아래의 상단바, 네비게이터 색상 변경하기
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flexible Test',
      home: MyAppTest07(),
    );
  }
}

class MyAppTest07 extends StatefulWidget {
  const MyAppTest07({Key? key}) : super(key: key);

  @override
  _MyAppTest07State createState() => _MyAppTest07State();
}

class _MyAppTest07State extends State<MyAppTest07> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataTable, CheckBox, Toggle'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined))
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'People-chart',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // 위젯을 세부적으로 위치시키려면 Align
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('id')),
                        DataColumn(label: Text('name')),
                        DataColumn(label: Text('ProFession')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('stephen')),
                          DataCell(Text('Actor')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('5')),
                          DataCell(Text('John')),
                          DataCell(Text('Student')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('10')),
                          DataCell(Text('Harry')),
                          DataCell(Text('Leader')),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: CheckboxListTile(
              title: const Text('Animate Slowly'),
              value: timeDilation != 1,
              onChanged: (bool? value) {
                setState(() {
                  timeDilation = value! ? 4 : 1; // 앞에 숫자로 누를때 느리게 박스 제어
                });
              },
              secondary: const Icon(Icons.hourglass_empty),
            ),
          ),
          Flexible(
            flex: 1,
            child: SwitchListTile(
              title: const Text('Lights'),
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                  // ignore: avoid_print
                  print('light set $_lights');
                });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            ),
          ),
        ],
      ),
    );
  }
}
