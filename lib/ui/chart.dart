import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 250,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 25,
                  child: SimpleLineChart(),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 25,
                  child: SimplePieChart(),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 25,
                  child: SimpleBarChart(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// LineChart

class SimpleLineChart extends StatefulWidget {
  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  List<chart.Series> seriesList;

  static List<chart.Series<SalesLine, int>> _createSampleData() {
    final data = [
      new SalesLine(0, 5),
      new SalesLine(1, 25),
      new SalesLine(2, 100),
      new SalesLine(3, 75),
    ];

    return [
      new chart.Series<SalesLine, int>(
          id: 'Sales',
          data: data,
          colorFn: (SalesLine, int) => chart.MaterialPalette.blue.shadeDefault,
          domainFn: (SalesLine sales, int) => sales.year,
          measureFn: (SalesLine sales, int) => sales.sales)
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: chart.LineChart(seriesList, animate: true));
  }
}

class SalesLine {
  final int year;
  final int sales;

  SalesLine(this.year, this.sales);
}

// Pie Chart

class SimplePieChart extends StatefulWidget {
  @override
  _SimplePieChartState createState() => _SimplePieChartState();
}

class _SimplePieChartState extends State<SimplePieChart> {
  List<chart.Series> seriesListPie;

  List<chart.Series<SalesPie, String>> _getPieData() {
    final pieData = [
      new SalesPie("0", 12),
      new SalesPie("1", 23),
      new SalesPie("2", 16),
      new SalesPie("3", 32),
      new SalesPie("5", 19),
    ];

    return [
      new chart.Series<SalesPie, String>(
          id: "Sales",
          data: pieData,
          domainFn: (SalesPie pie, _) => pie.year,
          measureFn: (SalesPie pie, _) => pie.sales)
    ];
  }

  @override
  void initState() {
    super.initState();
    seriesListPie = _getPieData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: chart.PieChart(
        seriesListPie,
        animate: true,
        defaultRenderer: chart.ArcRendererConfig(arcRendererDecorators: [
          chart.ArcLabelDecorator(labelPosition: chart.ArcLabelPosition.outside)
        ]),
      ),
    );
  }
}

class SalesPie {
  final String year;
  final int sales;

  SalesPie(this.year, this.sales);
}

// BarChart

class SimpleBarChart extends StatefulWidget {
  @override
  _SimpleBarChartState createState() => _SimpleBarChartState();
}

class _SimpleBarChartState extends State<SimpleBarChart> {
  List<chart.Series> seriesListChart;

  List<chart.Series<SalesBar, String>> _getBarData() {
    final dataList = [
      new SalesBar("0", 12),
      new SalesBar("1", 32),
      new SalesBar("2", 22),
      new SalesBar("3", 52),
      new SalesBar("5", 42),
    ];

    return [
      chart.Series<SalesBar, String>(
          id: "Sales",
          data: dataList,
          colorFn: (_, __) => chart.MaterialPalette.blue.shadeDefault,
          domainFn: (SalesBar bar, _) => bar.years,
          measureFn: (SalesBar bar, _) => bar.sales)
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesListChart = _getBarData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: chart.BarChart(
        seriesListChart,
        animate: true,
      ),
    );
  }
}

class SalesBar {
  String years;
  int sales;

  SalesBar(this.years, this.sales);
}

//
