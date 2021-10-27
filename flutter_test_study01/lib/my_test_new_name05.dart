import 'package:flutter/material.dart';

class MyTestNewName05 extends StatefulWidget {
  final String title;

  const MyTestNewName05({Key? key, required this.title}) : super(key: key);

  @override
  _MyTestNewName05State createState() => _MyTestNewName05State();
}

class _MyTestNewName05State extends State<MyTestNewName05> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 30,
        shadowColor: Colors.amber,

        //Drawer 메뉴를 구현하면 leading은 사용하면 안된다.
        // leading: IconButton(
        //   icon: const Icon(Icons.access_alarm),
        //   onPressed: () {
        //     print('access_alarm button is clicked');
        //   },
        // ),


        actions: [
          //actions -> 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        // 왼쪽으로 나오는 메뉴바 생성
        child: ListView(
          // 세로방향으로 여러줄의 정보를 보여준다. children 속성을 호출해 복수의 위젯 나열
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              //Drawer 헤드부분 생성 후 설정부분
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/fire.png'),
                backgroundColor: Colors.white, //이건 사진의 배경 색 설정
              ),
              otherAccountsPictures: const <Widget>[
                //다른 계정 추가는 여러 명이 가능해서 배열로 설정된다.
                CircleAvatar(
                  backgroundImage: AssetImage('assets/fireBan.png'),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/fireBan.png'),
                //   backgroundColor: Colors.white,
                // ),   // 이렇게 다수의 계정 추가 가능
              ],

              accountName: const Text('BBANTO'),
              accountEmail: const Text('bbanto@bbanto.com'),

              //onPressed 처럼 눌렀을 때 반응하는 버튼 추가
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                // 지금 Drawer 헤드부분 안에 있으니 -> 헤드부분 디자인 변경
                color: Colors.red[200],
                borderRadius: const BorderRadius.only(
                    //borderRadius -> 모서리 디자인 변경
                    bottomLeft:
                        Radius.circular(40.0), //Radius.circular -> 모서리 둥글게
                    bottomRight: Radius.circular(40.0)),
              ),
            ),
            ListTile(
              // 밑에 메뉴 리스트를 생성
              leading: Icon(
                Icons.home, // 왼쪽에 icon을 생성하고 아이콘 이름 추가
                color: Colors.grey[850],
              ),
              title: const Text('Home'),
              onTap: () {
                print('Home is clicked');
              },

              //trailing-> leading과는 반대로 ListTile 우측 끝나는 점에 아이콘과 이미지를 배치할 수 있는 속성
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text('setting'),
              onTap: () {
                print('setting is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: const Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('aaa'),
                        Text('bbb'),
                        Text('ccc'),
                        Text('ddd'),
                        Text('eee'),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
