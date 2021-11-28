import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'stock.dart';
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

List<StockData> forcastChartData = [];
List<StockData> yChartData = [];

Future<void> getJson() async {
  //String url = "http://127.0.0.1:5000/stock";
  var response = await http.get(Uri.parse("http://10.0.2.2:5000/stock"));

  var jsonData = response.body;

  forcastChartData = [
    for (int i = 0; i < 20; i++)
      StockData(i, jsonDecode(jsonData)['$i']['forcast_Close'])
  ];
  yChartData = [
    for (int i = 0; i < 20; i++)
      if (jsonDecode(jsonData)['$i']['y_Close'] != null)
        StockData(i, jsonDecode(jsonData)['$i']['y_Close'])
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

  //zooming
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior =
        ZoomPanBehavior(enablePinching: true, enableDoubleTapZooming: true);
    Future.delayed(Duration.zero, () async {
      await getJson();

      // initState에서 빌드를 한번 임의적으로 시켜준것
      setState(() {});
    });

    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      enablePanning: true,
      enableMouseWheelZooming: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('=======$forcastChartData');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Forcast'),
      ),
      body: SfCartesianChart(
        title: ChartTitle(text: '5 Days Stock Forcast'),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: _zoomPanBehavior,
        primaryXAxis: CategoryAxis(
          plotBands: <PlotBand>[
            PlotBand(
                isVisible: true,
                color: Colors.amberAccent,
                start: 14,
                end: 20,
                text: '금일 기준 5일 예측',
                textAngle: 0,
                textStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 1),
        series: <ChartSeries>[
          LineSeries<StockData, int>(
              name: '실제값',
              dataSource: yChartData,
              xValueMapper: (StockData stock, _) => stock.xLabel,
              yValueMapper: (StockData stock, _) => stock.stockData,
              color: Colors.black),
          SplineSeries<StockData, int>(
              name: '예측값',
              dataSource: forcastChartData,
              xValueMapper: (StockData stock, _) => stock.xLabel,
              yValueMapper: (StockData stock, _) => stock.stockData,
              color: Colors.red,
              width: 5,
              opacity: 0.9,
              dashArray: const <double>[10, 10]),
        ],
      ),
    );
  }
}
