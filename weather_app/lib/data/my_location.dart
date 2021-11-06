import 'package:geolocator/geolocator.dart';

// 내 위치 정보(위도, 경도) 값을 저장하는 클래스
class MyLocation {
  double? latitude2;
  double? longitude2;

  //await 키워드는 항상 Future 값을 기다리므로 void가 아닌 Future<void>로 선언 해야한다.
  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      //위도와 경도값을 api로 받아온 것
      latitude2 = position.latitude;
      longitude2 = position.longitude;

      print(position);
      print(latitude2);
      print(longitude2);
    } catch (e) {
      print("There was a problem with the internet connection.");
    }
  }
}