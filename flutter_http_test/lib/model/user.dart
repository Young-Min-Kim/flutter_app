class User {
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

  User(
      this.dataNumber,
      this.dataAlphaA,
      this.dataAlphaB,
      this.dataAlphaC,
      this.dataDescription,
      this.dataIsActive,
      this.dataName,
      this.dataRegDate,
      this.dataScale,
      this.dataSeqNumber,
      this.dataType,
      this.dataUserName,
      this.dataUserNumber,
      this.dataVersionCode);

  factory User.fromJson(Map<String, dynamic> data) {
    var result = User(
      data['dataNumber'],
      data['dataAlphaA'],
      data['dataAlphaB'],
      data['dataAlphaC'],
      data['dataDescription'],
      data['dataIsActive'],
      data['dataName'],
      data['dataRegDate'],
      data['dataScale'],
      data['dataSeqNumber'],
      data['dataType'],
      data['dataUserName'],
      data['dataUserNumber'],
      data['dataVersionCode'],
    );
    return result;
  }
}
