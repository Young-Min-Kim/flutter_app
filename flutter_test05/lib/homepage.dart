import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final isSelected = <bool>[false, false, false];

class _HomePageState extends State<HomePage> {
  static final Map<String, String> stepMap = {
    '준비': '준비',
    '작업중': '작업중',
    '완료': '완료',
  };
  String _selectedStep = stepMap.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          '정비 상세',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          iconSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lime[900],
                          minimumSize: const Size(30, 30),
                        ),
                        icon: const Icon(Icons.car_rental),
                        label: const Text('입고전'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '45누4652',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                          children: [
                            TextSpan(
                              text: ' 차량정비상세',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('범퍼'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                minimumSize: const Size(60, 30)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('앞 우측문'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                minimumSize: const Size(80, 30)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('뒤 좌측문'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber[600],
                                minimumSize: const Size(80, 30)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black,
                        thickness: 2,
                        endIndent: 350,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '김승옥 010-2222-3333',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              '고객정보변경',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                minimumSize: const Size(70, 25)),
                          ),
                        ],
                      ),
                      Container(
                        height: 143,
                        width: 326,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 6, 6, 6),
                              child: Text(
                                '갤러리',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Image.asset('images/car.png',
                                      height: 81, width: 81, fit: BoxFit.none),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('images/car.png',
                                      height: 81, width: 81, fit: BoxFit.none),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('images/car.png',
                                      height: 81, width: 81, fit: BoxFit.none),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 81,
                                    width: 81,
                                    color: Colors.grey[400],
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 208,
                        width: 326,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 6, 6, 6),
                                  child: Text(
                                    '경정비',
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: CupertinoRadioChoice(
                                    choices: stepMap,
                                    onChange: onSelected,
                                    initialKeyValue: _selectedStep,
                                    selectedColor: const Color(0xFF6200EE),
                                  ),
                                  // ToggleButtons(
                                  //   color: Colors.black.withOpacity(0.60),
                                  //   selectedColor: const Color(0xFF6200EE),
                                  //   selectedBorderColor: const Color(0xFF6200EE),
                                  //   fillColor: const Color(0xFF6200EE).withOpacity(0.08),
                                  //   splashColor: const Color(0xFF6200EE).withOpacity(0.12),
                                  //   hoverColor: const Color(0xFF6200EE).withOpacity(0.04),
                                  //   borderRadius: BorderRadius.circular(13),
                                  //   constraints: const BoxConstraints(minHeight: 30.0),
                                  //   children: const [
                                  //     Padding(
                                  //       padding:
                                  //           EdgeInsets.symmetric(horizontal: 8.0),
                                  //       child: Text('준비'),
                                  //     ),
                                  //     Padding(
                                  //       padding:
                                  //           EdgeInsets.symmetric(horizontal: 8.0),
                                  //       child: Text('작업중'),
                                  //     ),
                                  //     Padding(
                                  //       padding:
                                  //           EdgeInsets.symmetric(horizontal: 8.0),
                                  //       child: Text('완료'),
                                  //     ),

                                  //   ],
                                  //   isSelected: isSelected,
                                  //   onPressed: (index) {
                                  //     // Respond to button selection
                                  //     setState(() {
                                  //       isSelected[index] = !isSelected[index];
                                  //     });
                                  //   },
                                  // ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Image.asset('images/car.png',
                                      height: 163,
                                      width: 163,
                                      fit: BoxFit.none),
                                  Image.asset('images/car.png',
                                      height: 163,
                                      width: 163,
                                      fit: BoxFit.none),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: 330,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: 330,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('작업리스트'), icon: Icon(Icons.list)),
          BottomNavigationBarItem(
              title: Text('내정보'),
              icon: Icon(Icons.supervised_user_circle_sharp)),
        ],
      ),
    );
  }

  void onSelected(String stepKey) {
    setState(() {
      _selectedStep = stepKey;
    });
  }
}
