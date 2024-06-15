import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../core/utils/ColorFile.dart';

class OiVsTimeChartScreen extends StatefulWidget {
  OiVsTimeChartScreen({Key? key}) : super(key: key);

  @override
  _OiVsTimeChartScreenState createState() => _OiVsTimeChartScreenState();
}

class _OiVsTimeChartScreenState extends State<OiVsTimeChartScreen> {
  late List<FIIDIIData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior zoomPanBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior =
        TooltipBehavior(enable: true, canShowMarker: true, duration: 2000);
    zoomPanBehavior = ZoomPanBehavior(
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.xy,
      enablePinching: true,
      enablePanning: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          // backgroundColor: AppColors.appColor,
          title: Text(
            "Fii Data",
            style: TextStyle(
                fontSize: 21.h,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
        ),
        body: SfCartesianChart(
          zoomPanBehavior: zoomPanBehavior,
          enableAxisAnimation: true,
          title: ChartTitle(text: 'Outstanding, Index'),
          legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: [
            BarSeries<FIIDIIData, String>(
                color: AppColors.grey,
                spacing: 0.25,
                name: 'Futures',
                dataSource: _chartData,
                xValueMapper: (FIIDIIData gdp, _) => gdp.continent,
                yValueMapper: (FIIDIIData gdp, _) => gdp.future,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true),
            BarSeries<FIIDIIData, String>(
                color: Colors.green,
                spacing: 0.25,
                name: 'Calls',
                dataSource: _chartData,
                xValueMapper: (FIIDIIData gdp, _) => gdp.continent,
                yValueMapper: (FIIDIIData gdp, _) => gdp.call,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true),
            BarSeries<FIIDIIData, String>(
                color: Colors.red,
                spacing: 0.25,
                name: 'Puts',
                dataSource: _chartData,
                xValueMapper: (FIIDIIData gdp, _) => gdp.continent,
                yValueMapper: (FIIDIIData gdp, _) => gdp.puts,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true),
          ],
          primaryXAxis: CategoryAxis(
            majorTickLines: MajorTickLines(
              width: 0
            ),
          ),
          primaryYAxis: NumericAxis(
            majorTickLines: MajorTickLines(
              width: 0
            ),
              opposedPosition: true,
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              numberFormat: NumberFormat(),
              title: AxisTitle(text: 'FII in Crors')),
        ),
      ),
    );
  }

  List<FIIDIIData> getChartData() {
    final List<FIIDIIData> chartData = [
      FIIDIIData('16-FEB-2024', 200, 80, 120),
      FIIDIIData('15-FEB-2024', -150, 110, 20),
      FIIDIIData('14-FEB-2024', -100, -180, 80),
      FIIDIIData('13-FEB-2024', 130, 200, -120),
      FIIDIIData('12-FEB-2024', 100, 80, 110),
      FIIDIIData('098-FEB-2024', -120, 30, 120),
    ];
    return chartData;
  }
}

class FIIDIIData {
  FIIDIIData(this.continent, this.future, this.call, this.puts);

  final String continent;
  final int future;
  final int call;
  final int puts;
}
