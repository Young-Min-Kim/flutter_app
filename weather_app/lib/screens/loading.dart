import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = 'ffffaf2ef2195dcecb9310d34a641fa5';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();

    // getMyCurrentLocation() 메소드에서 await 키워드를 통해 기다렸다가 값을 받아오므로 여기서도 await으로 기다려야한다.
    await myLocation.getMyCurrentLocation();

    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');

    //network 함수는 awaut 키워드를 사용해 값을 기다리므로 여기서도 await으로 기달려줘야 한다.
    var weartherData = await network.getJsonData();
    print(weartherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weartherData,
        parseAirPollution: airData,
      );
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
