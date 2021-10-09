import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
// as를 붙인 이유는 Response와 get 메서드는 패키지마다 다양하기 때문에 어느곳에서 나왔는지 다른 사람들도 확인하기 용이하도록  해준 것

import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print("There was a problem with the internet connection.");
    }
  }

  void fetchData() async {
    // http:0.13.3 버전으로 올라가면서 Uri를 parse 하도록 사용 방식이 변경되었다.
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if (response.statusCode == 200) {
      String jsonData = response.body;

      //jsonDecode 의 타입은 dynamic 이므로 저장할 변수 선언 시에는 var 타입으로 해야한다.
      var myJson1 = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson1);

      var myJson2 = jsonDecode(jsonData)['wind']['speed'];
      print(myJson2);

      var myJson3 = jsonDecode(jsonData)['id'];
      print(myJson3);

    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text(
            'Get my location',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
