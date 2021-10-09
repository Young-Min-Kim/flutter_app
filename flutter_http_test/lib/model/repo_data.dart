import 'package:flutter_http_test/main.dart';
import 'dart:convert';
class RepoDart {
  String? result;
  String? message;
  Data? data;

  RepoDart({this.result, this.message, this.data});

  RepoDart.fromJson(Map<String, dynamic> resultJson) {
    result = resultJson['result'];
    message = resultJson['message'];
    
    final Map<String, dynamic> temp = resultJson['object'];

    data = Data.fromJson(temp);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    data['object'] = this.data;
    
    return data;
  }
}

class Data {
  int? dataNumber;
  String? dataUserName;
  String? dataVersionCode;
  int? dataSeqNumber;
  int? dataUserNumber;
  String? dataName;
  String? dataType;
  String? dataRegDate;
  String? dataDescription;
  bool? dataIsActive;
  String? dataScale;
  String? dataAlphaA;
  String? dataAlphaB;
  String? dataAlphaC;
  String? dataSrcUrl;
  String? dataOutputUrl;
  String? dataDownloadUrl;
  String? dataUpdateDate;
  String? dataHpUrl;
  String? dataQrUrl;
  String? dataInstaUrl;
  String? dataCsNumber;
  String? dataProductNumber;
  String? dataEnterpriseName;
  String? dataEnterpriseImgUrl;
  String? dataMainImgUrl;


  Data(
      {required this.dataNumber,
      required this.dataUserName,
      required this.dataVersionCode,
      required this.dataSeqNumber,
      required this.dataUserNumber,
      required this.dataName,
      required this.dataType,
      required this.dataRegDate,
      required this.dataDescription,
      required this.dataIsActive,
      required this.dataScale,
      required this.dataAlphaA,
      required this.dataAlphaB,
      required this.dataAlphaC,
      required this.dataSrcUrl,
      required this.dataOutputUrl,
      required this.dataDownloadUrl,
      required this.dataUpdateDate,
      required this.dataHpUrl,
      required this.dataQrUrl,
      required this.dataInstaUrl,
      required this.dataCsNumber,
      required this.dataProductNumber,
      required this.dataEnterpriseName,
      required this.dataEnterpriseImgUrl,
      required this.dataMainImgUrl,
      }
  );
  


  Data.fromJson(Map<String, dynamic> json) {
    dataNumber = json['dataNumber'];
    dataUserName = json['dataUserName'];
    dataVersionCode = json['dataVersionCode'];
    dataSeqNumber = json['dataSeqNumber'];
    dataUserNumber = json['dataUserNumber'];
    dataName = json['dataName'];
    dataType = json['dataType'];
    dataRegDate = json['dataRegDate'];
    dataDescription = json['dataDescription'];
    dataIsActive = json['dataIsActive'];
    dataScale = json['dataScale'];
    dataAlphaA = json['dataAlphaA'];
    dataAlphaB = json['dataAlphaB'];
    dataAlphaC = json['dataAlphaC'];
    dataSrcUrl = json['dataSrcUrl'];
    dataOutputUrl = json['dataOutputUrl'];
    dataDownloadUrl = json['dataDownloadUrl'];
    dataUpdateDate = json['dataUpdateDate'];
    dataHpUrl = json['dataHpUrl'];
    dataQrUrl = json['dataQrUrl'];
    dataInstaUrl = json['dataInstaUrl'];
    dataCsNumber = json['dataCsNumber'];
    dataProductNumber = json['dataProductNumber'];
    dataEnterpriseName = json['dataEnterpriseName'];
    dataEnterpriseImgUrl = json['dataEnterpriseImgUrl'];
    dataMainImgUrl = json['dataMainImgUrl'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataNumber'] = this.dataNumber;
    data['dataUserName'] = this.dataUserName;
    data['dataVersionCode'] = this.dataVersionCode;
    data['dataSeqNumber'] = this.dataSeqNumber;
    data['dataUserNumber'] = this.dataUserNumber;
    data['dataName'] = this.dataName;
    data['dataType'] = this.dataType;
    data['dataRegDate'] = this.dataRegDate;
    data['dataDescription'] = this.dataDescription;
    data['dataIsActive'] = this.dataIsActive;
    data['dataScale'] = this.dataScale;
    data['dataAlphaA'] = this.dataAlphaA;
    data['dataAlphaB'] = this.dataAlphaB;
    data['dataAlphaC'] = this.dataAlphaC;
    data['dataSrcUrl'] = this.dataSrcUrl;
    data['dataOutputUrl'] = this.dataOutputUrl;
    data['dataDownloadUrl'] = this.dataDownloadUrl;
    data['dataUpdateDate'] = this.dataUpdateDate;
    data['dataHpUrl'] = this.dataHpUrl;
    data['dataQrUrl'] = this.dataQrUrl;
    data['dataInstaUrl'] = this.dataInstaUrl;
    data['dataCsNumber'] = this.dataCsNumber;
    data['dataProductNumber'] = this.dataProductNumber;
    data['dataEnterpriseName'] = this.dataEnterpriseName;
    data['dataEnterpriseImgUrl'] = this.dataEnterpriseImgUrl;
    data['dataMainImgUrl'] = this.dataMainImgUrl;
  
    return data;
  }
}

