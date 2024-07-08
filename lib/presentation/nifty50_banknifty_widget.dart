import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:provider/provider.dart';

import '../Controller/app_theme/ThemeModel.dart';
import '../core/utils/ColorFile.dart';
import '../widgets/App.dart';
import '../widgets/TextView.dart';
import 'chart_screen/chart_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Widget buildRecentOrders(BuildContext context, String appBarTitle) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
    ),
    child: Column(
      children: [
        SizedBox(height: 15.h),
        Text(
          MyString.market_Overview,
          style: TextStyle(
            fontSize: 21.h,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 10.v),
        Divider(
          endIndent: 10,
          indent: 10,
          color: Theme.of(context).colorScheme.onError,
        ),
        SizedBox(height: 15.v),
        niftyAndBankNiftyWidget(),
        SizedBoxView(height: 20),
      ],
    ),
  );
}

dialogBoxFun({
  required String cp,
  required String change,
  required String percentage,
  required String op,
  required String hp,
  required String lp,
  required int lastDayCp,
  required int lastCp,
  required String type,
  required String precentageMark,
  required context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            insetPadding: EdgeInsets.only(left: 10, right: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            title: Center(
              child: Text(MyString.index_Overview),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: TextView(
                              text: type == MyString.bank_Nifty
                                  ? MyString.bank_Nifty1
                                  : MyString.nifty501,
                              textSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            color: Theme.of(context).colorScheme.secondary,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.current,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text: cp == null ? "00.00" : cp.toString(),
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                  textColor: cp == null
                                      ? Colors.grey
                                      : lastDayCp < 0
                                      ? AppColors.red
                                      : AppColors.green,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.change,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text:
                                  "${lastDayCp > 0 ? "+" : ""}${lastDayCp == null ? "00" : lastDayCp.toStringAsFixed(2)}",
                                  textColor: cp == null
                                      ? Colors.grey
                                      : lastDayCp < 0
                                      ? AppColors.red
                                      : AppColors.green,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            color: Theme.of(context).colorScheme.secondary,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.percent,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text:
                                  "${percentage}",
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.open,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text: op == null ? " " : op.toString(),
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            color: Theme.of(context).colorScheme.secondary,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.high,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text: hp == null ? " " : hp.toString(),
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.low,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text: lp == null ? " " : lp.toString(),
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10, left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.prev_lose,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextView(
                                  text:
                                  lastCp == null ? " " : lastCp.toString(),
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBoxView(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyChartPage(
                            type: type,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(),
                      ),
                      child: TextView(text: MyString.open_chart),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class NiftyData {
  final String cp;
  final int lastDayCp;
  final String percentage;
  final String op;
  final String hp;
  final String lp;
  final int lastCp;
  final String precentageMark;

  NiftyData({
    required this.cp,
    required this.lastDayCp,
    required this.percentage,
    required this.op,
    required this.hp,
    required this.lp,
    required this.lastCp,
    required this.precentageMark,
  });

  factory NiftyData.fromJson(Map<String, dynamic> json) {
    return NiftyData(
      cp: json['cp'],
      lastDayCp: json['lastDayCp'],
      percentage: json['percentage'],
      op: json['op'],
      hp: json['hp'],
      lp: json['lp'],
      lastCp: json['lastCp'],
      precentageMark: json['percentageMark'],
    );
  }
}

// Function to fetch data from API
Future<NiftyData> fetchNiftyData(String type) async {
  final response = await http.get(Uri.parse('http://epistlebe.tech:5000/topbar/$type'));

  if (response.statusCode == 200) {
    return NiftyData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class NiftyAndBankNiftyWidget extends StatefulWidget {
  @override
  _NiftyAndBankNiftyWidgetState createState() => _NiftyAndBankNiftyWidgetState();
}

class _NiftyAndBankNiftyWidgetState extends State<NiftyAndBankNiftyWidget> {
  late Timer _timer;
  late Future<NiftyData> _niftyDataFuture;
  late Future<NiftyData> _bankNiftyDataFuture;
  NiftyData? _niftyData;
  NiftyData? _bankNiftyData;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _fetchData();
    });
  }

  void _fetchData() {
    fetchNiftyData('nifty50').then((data) {
      setState(() {
        _niftyData = data;
      });
    });
    fetchNiftyData('banknifty').then((data) {
      setState(() {
        _bankNiftyData = data;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.h, right: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNiftyWidget(context, _niftyData, 'nifty50'),
          _buildNiftyWidget(context, _bankNiftyData, 'banknifty'),
        ],
      ),
    );
  }

  Widget _buildNiftyWidget(BuildContext context, NiftyData? data, String type) {
    return InkWell(
      onTap: () {
        if (data != null) {
          dialogBoxFun(
            cp: data.cp.toString(),
            change: data.lastDayCp.toString(),
            percentage: data.percentage.toString(),
            op: data.op.toString(),
            hp: data.hp.toString(),
            lp: data.lp.toString(),
            lastDayCp: data.lastDayCp,
            lastCp: data.lastCp,
            type: type,
            precentageMark: data.precentageMark,
            context: context,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 5, top: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.h),
        ),
        width: MediaQuery.of(context).size.width / 2.5,
        child: Column(
          children: [
            Text(
              type == 'nifty50' ? MyString.nifty50 : MyString.bank_Nifty,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            if (data != null)
              Text(
                "${data.cp.toString()} (${data.precentageMark}${data.percentage})",
                style: TextStyle(
                  color: data.precentageMark == "-"
                      ? AppColors.red
                      : AppColors.green,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

Widget niftyAndBankNiftyWidget() {
  return NiftyAndBankNiftyWidget();
}
