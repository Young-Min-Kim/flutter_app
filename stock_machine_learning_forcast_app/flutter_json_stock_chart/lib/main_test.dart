import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'stock.dart';
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

List yDataList = [];
List forcastDataList = [];

List<StockData> chartData = [];

Future<dynamic>? _chartData = [] as Future?;
var jsonData;

Future<List<StockData>> getJson() async {
  //String url = "http://127.0.0.1:5000/stock";
  var response = await http.get(Uri.parse("http://10.0.2.2:5000/stock"));

  //print(response.body);

  jsonData = response.body;
  double dataY = jsonDecode(jsonData)['0']['y_Close'];
  print(dataY);

  for (int i = 0; i < 20; i++) {
    if (jsonDecode(jsonData)['$i']['y_Close'] != null) {
      yDataList.add(jsonDecode(jsonData)['$i']['y_Close']);
    }
  }

  return chartData = [
    for (int i = 0; i < 20; i++)
      StockData(i, jsonDecode(jsonData)['$i']['forcast_Close'])
  ];
}

List<StockData> getData() {
  return chartData = [
    for (int i = 0; i < 20; i++)
      StockData(i, jsonDecode(jsonData)['$i']['forcast_Close'])
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json Data Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStockApp(),
    );
  }
}

class MyStockApp extends StatefulWidget {
  const MyStockApp({Key? key}) : super(key: key);

  @override
  State<MyStockApp> createState() => _MyStockAppState();
}

class _MyStockAppState extends State<MyStockApp> {
  late TooltipBehavior _tooltipBehavior;

  @override
  Future<void> initState() async {
    _tooltipBehavior = TooltipBehavior(enable: true);

    // Future.delayed(Duration.zero, () async {
    //   await getJson();
    // });
    _chartData = getJson();
    //getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Forcast'),
      ),
      body: FutureBuilder(
        future: _chartData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue)),
            );
          } else {
            // data loaded:
            return SfCartesianChart(
              title: ChartTitle(text: '5 Days Stock Forcast'),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<StockData, int>(
                  dataSource: chartData,
                  xValueMapper: (StockData stock, _) => stock.xLabel,
                  yValueMapper: (StockData stock, _) => stock.stockData,
                )
              ],
            );
          }
        },
      ),
    );
  }
}
