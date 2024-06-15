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

dialogBoxFun(
    {required double cp,
    required double change,
    required double percentage,
    required double op,
    required double hp,
    required double lp,
    required double lastDayCp,
    required double lastCp,
    required String type,
    required context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            insetPadding: EdgeInsets.only(left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            title: Center(
                child: Text(
              MyString.index_Overview,
            )),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
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
                                fontWeight: FontWeight.w600),
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
                                /*Consumer<ThemeModel>(
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return TextView(
                                        text:
                                            "${value.percentage! > 0 ? "+" : ""}${value.percentage!.toStringAsFixed(2)}",
                                        textColor: value.cp == null
                                            ? Colors.grey
                                            : value.percentage! < 0
                                                ? AppColors.red
                                                : AppColors.green,
                                        textSize: 16.h,
                                        fontWeight: FontWeight.w400,
                                      );
                                    },
                                  ),*/
                                TextView(
                                  text:
                                      "${percentage > 0 ? "+" : ""}${percentage.toStringAsFixed(2)}",
                                  textColor: cp == null
                                      ? Colors.grey
                                      : percentage < 0
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
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: MyString.open,
                                  textSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                ),
                                /* Consumer<ThemeModel>(
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return TextView(
                                        text: value.op == null
                                            ? " "
                                            : value.op.toString(),
                                        textSize: 16.h,
                                        fontWeight: FontWeight.w400,
                                      );
                                    },
                                  ),*/
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
                                /*Consumer<ThemeModel>(
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return TextView(
                                        text: value.hp == null
                                            ? " "
                                            : value.hp.toString(),
                                        textSize: 16.h,
                                        fontWeight: FontWeight.w400,
                                      );
                                    },
                                  ),*/
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
                                /*   Consumer<ThemeModel>(
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return TextView(
                                        text: value.lp == null
                                            ? " "
                                            : value.lp.toString(),
                                        textSize: 16.h,
                                        fontWeight: FontWeight.w400,
                                      );
                                    },
                                  ),*/
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
                                  bottomLeft: Radius.circular(20)),
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
                          ));
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

Widget niftyAndBankNiftyWidget(){
  return Container(
    margin: EdgeInsets.only(left: 10.h,right: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<ThemeModel>(
          builder: (BuildContext context, value, Widget? child) {
            return InkWell(
              onTap: () => dialogBoxFun(
                cp: value.cp!,
                change: value.lastDayCp!,
                percentage: value.percentage!,
                op: value.op!,
                hp: value.hp!,
                lp: value.lp!,
                lastDayCp: value.lastDayCp!,
                lastCp: value.lastCp!,
                type: MyString.nifty50,
                context: context,
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 5, top: 5),
                alignment: Alignment.center,
                // height: 70.v,
                decoration: BoxDecoration(
                  //    color: appTheme.blueGray100.withOpacity(0.32),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    20.h,
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  children: [
                    Text(
                      MyString.nifty50,
                      style: TextStyle(
                        //   color: AppColors.white,
                          color: AppColors.black,
                          // color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 15.h,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      value.cp == null
                          ? "00.00(+00)"
                          : "${value.cp.toString()} (${value.lastDayCp! > 0 ? "+" : ""}${value.lastDayCp!.toStringAsFixed(2)})",
                      style: TextStyle(
                          color: value.cp == null
                              ? Colors.white
                              : value.lastDayCp! < 0
                              ? AppColors.red
                              : AppColors.green,
                          fontSize: 15.h,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Consumer<ThemeModel>(
          builder: (BuildContext context, value, Widget? child) {
            return InkWell(
              onTap: () => dialogBoxFun(
                cp: value.cpBank!,
                change: value.lastDayBankCp!,
                percentage: value.percentageBank!,
                op: value.opBank!,
                hp: value.hpBank!,
                lp: value.lpBank!,
                lastDayCp: value.lastDayBankCp!,
                lastCp: value.lastBankCp!,
                type: MyString.bank_Nifty,
                context: context,
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 5, top: 5),
                alignment: Alignment.center,
                // height: 70.v,
                decoration: BoxDecoration(
                  //  color: appTheme.blueGray100.withOpacity(0.32),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    20.h,
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  children: [
                    Text(
                      MyString.bank_Nifty,
                      style: TextStyle(
                        //   color: AppColors.white,
                          color: AppColors.black,
                          // color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 15.h,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<ThemeModel>(
                      builder:
                          (BuildContext context, value, Widget? child) {
                        return Text(
                          value.cpBank == null
                              ? "00.00(+00)"
                              : "${value.cpBank.toString()} (${value.lastDayBankCp! > 0 ? "+" : ""}${value.lastDayBankCp!.toStringAsFixed(2)})",
                          style: TextStyle(
                              color: value.cpBank == null
                                  ? Colors.white
                                  : value.lastDayBankCp! < 0
                                  ? AppColors.red
                                  : AppColors.green,
                              fontSize: 15.h,
                              fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}