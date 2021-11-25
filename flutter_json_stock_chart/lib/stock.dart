class Stock {
  late double yClose;
  late double forcastClose;

  Stock(this.yClose, this.forcastClose);

  factory Stock.fromJson(Map<dynamic, dynamic> data) {
    var result = Stock(data['yClose'], data['forcastClose']);
    return result;
  }
}
