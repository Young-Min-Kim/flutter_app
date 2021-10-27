import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({this.parseWeatherData, this.parseAirPollution});

  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temp;

  // 날씨 아이콘 불러오기 위한 선언들
  Model model = Model();
  Widget? icon;
  String? des;

  //대기질 지수 관련 위젯 선언
  Widget? airIcon;
  Widget? airState;

  //미세먼지, 초미세 먼지 변수 선언
  double? dust1;
  double? dust2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //이 데이터가 widget을 통해 넘어왔으므로 앞에 widget 적어줘야 한다.
    // 설명 -> https://youtu.be/c1PNEa_eiIM?t=1623
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    print(airData);

    //round() 로 소수점 버림
    temp = weatherData['main']['temp'].round();
    print(temp);

    cityName = weatherData['name'];
    print(cityName);

    // 날씨에 따른 아이콘(icon), 설명(des) 변경 기능
    int condition = weatherData['weather'][0]['id'];
    print('======$condition======');
    icon = model.getWeatherIcon(condition);
    des = weatherData['weather'][0]['description'];

    //대기질 지수 관련 인덱스 선언
    var index = airData['list'][0]['main']['aqi'];
    print('=======$index=======');
    airIcon = model.getAirIcon(index);
    airState = model.getAirCondition(index);

    //미세먼지, 초미세먼지
    dust1 = airData['list'][0]['components']['pm10'];
    dust2 = airData['list'][0]['components']['pm2_5'];
  }

  // 제목 밑에 시간 출력을 위함
  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat(
      "h:mm a",
    ).format(now);
  }

  // 날짜와 요일 출력 위한 변수
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 바디를 앱바 뒤의 위치까지 확장시킨다는 의미
      //backgroundColor: Colors.orange, // 아래 이미지 대신에 그냥 이렇게 사용도 가능
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 앱바 색을 투명으로 설정하여 버튼만 남기고 숨기기
        elevation: 0, // 높이 0으로 설정
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30,
          )
        ],
      ),
      // Stack 위젯은 컨테이너와 같은 위젯들을 서로 겹치게 배치하고 싶을때 사용한다.
      body: Stack(
        children: [
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover, // 해당 이미지를 크기에 맞춰서 배치
            width: double.infinity, // 배경화면을 꽉차게 덮기 위해서 infinity 설정 추가
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Column(
                              // 왼쪽으로 정렬
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Text(
                                  '$cityName',
                                  style: GoogleFonts.lato(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    TimerBuilder.periodic(
                                      (Duration(minutes: 1)),
                                      builder: (context) {
                                        print('${getSystemTime()}');
                                        return Text(
                                          '${getSystemTime()}',
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              color: Colors.white),
                                        );
                                      },
                                    ),
                                    Text(
                                      DateFormat(' - EEEE').format(date),
                                      style: GoogleFonts.lato(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      DateFormat(', d MMM, yyy').format(date),
                                      style: GoogleFonts.lato(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp \u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                icon!,
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  des!,
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15,
                        thickness: 2,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질 지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              airIcon!,
                              SizedBox(
                                height: 10,
                              ),
                              airState!,
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$dust1',
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '㎍/㎥',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$dust2',
                                style: GoogleFonts.lato(
                                    fontSize: 24, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '㎍/㎥',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
