import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/fii_data_screen/Widget/fll_data_widget.dart';
import 'package:prayas_capital/presentation/fii_data_screen/Widget/fll_dll_buy_sell_widget.dart';
import 'package:prayas_capital/presentation/fii_data_screen/Widget/outstanding_ol_widget.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Controller/app_theme/ThemeModel.dart';
import 'Widget/fll_activity_widget.dart';

class FiiDataScreen extends StatelessWidget {
  DateTime date = DateTime.now();
  DateFormat format = new DateFormat("MMMM dd, yyyy");

  @override
  Widget build(BuildContext context) {
    final fllDateController = Provider.of<ThemeModel>(context, listen: false);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          // backgroundColor: AppColors.appColor,
          title: Text(
            "Fll Data",
            style: TextStyle(
                fontSize: 21.h,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        fllDateController.dateDialogBox(context);
                      },
                      child:
                          Image.asset(
                        ImageConstant.monthSummrayIcon,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 3.v,
                        bottom: 3.v,
                      ),
                      child: Consumer<ThemeModel>(
                        builder: (BuildContext context, value, Widget? child) {
                          return Text(
                            ("${value.date.day} ${value.date.month} ${value.date.year}")
                                .toString(),
                            style: TextStyle(fontSize: 18.h),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.v),
                Consumer<ThemeModel>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Outstanding Ol Of Fll as on",
                          style: TextStyle(fontSize: 23.h),
                        ),
                        Text(
                          ("${value.date.day}-${value.date.month}-${value.date.year}")
                              .toString(),
                          style: TextStyle(fontSize: 23.h),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10.v),
                Consumer<ThemeModel>(
                  builder: (context, value, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: value.outStandingOl == 0
                          ? BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            )
                          : BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                fllDateController.findtype(0);
                              },
                              child: Container(
                                decoration: value.outStandingOl == 0
                                    ? BoxDecoration(
                                        color: AppColors.appColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      )
                                    : BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),

                                height: 40,
                                alignment: Alignment.center,
                                //  decoration: BoxDecoration(color: AppColors.appColor1),
                                child: TextView(
                                  text: "Index",
                                  textColor: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                fllDateController.findtype(1);
                              },
                              child: Container(
                                decoration: value.outStandingOl == 1
                                    ? BoxDecoration(
                                        color: AppColors.appColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      )
                                    : BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),

                                height: 40,
                                alignment: Alignment.center,
                                //  decoration: BoxDecoration(color: AppColors.appColor1),
                                child: TextView(
                                  text: "Stock",
                                  textColor: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBoxView(height: 20.v),
                OutstandingOlWidget(
                  optionType: 'Calls',
                  netQty: '-33,243',
                  qtyType: 'Bearish',
                  longOl: '1.32L',
                  shortOl: '1.66L',
                ),
                SizedBoxView(height: 10.h),
                OutstandingOlWidget(
                  optionType: 'Puts',
                  netQty: '11,441',
                  qtyType: 'Bearish',
                  longOl: '1.18L',
                  shortOl: '1.07L',
                ),
                SizedBoxView(height: 10.h),
                OutstandingOlWidget(
                  optionType: 'Future',
                  netQty: '-33,243',
                  qtyType: 'Bullish',
                  longOl: '16.14L',
                  shortOl: '14.58L',
                ),
                SizedBox(height: 20.v),
                FllDataButtonWidget(
                    context: context,
                    title: 'Ol vs Time Chart',
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.oiVsTimeChartScreen);
                    }),
                SizedBox(height: 20.v),
                Consumer<ThemeModel>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(
                      "Fll Activity on ${value.date.day}-${value.date.month}-${value.date.year}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 23.h),
                    );
                  },
                ),
                SizedBox(height: 20.v),
                Consumer<ThemeModel>(
                  builder: (context, value, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: value.outStandingOl == 0
                          ? BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            )
                          : BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                fllDateController.findtype(0);
                              },
                              child: Container(
                                decoration: value.outStandingOl == 0
                                    ? BoxDecoration(
                                        color: AppColors.appColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      )
                                    : BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),

                                height: 40,
                                alignment: Alignment.center,
                                //  decoration: BoxDecoration(color: AppColors.appColor1),
                                child: TextView(
                                  text: "Index",
                                  textColor: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                fllDateController.findtype(1);
                              },
                              child: Container(
                                decoration: value.outStandingOl == 1
                                    ? BoxDecoration(
                                        color: AppColors.appColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      )
                                    : BoxDecoration(
                                        color: AppColors.appColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),

                                height: 40,
                                alignment: Alignment.center,
                                //  decoration: BoxDecoration(color: AppColors.appColor1),
                                child: TextView(
                                  text: "Stock",
                                  textColor: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBoxView(height: 20.v),
                FllActivityWidget(
                  optionType: 'Calls',
                  netQty: '-1,549',
                  qtyType: 'Bearish',
                  longOl: '+9,290',
                  shortOl: '+10,839',
                  longProfitLoss: '+8.59%',
                  sortProfitLoss: '+5.37%',
                ),
                SizedBoxView(height: 10.v),
                FllActivityWidget(
                  optionType: 'Put',
                  netQty: '3,912',
                  qtyType: 'Bearish',
                  longOl: '+9,366',
                  shortOl: '+5,454',
                  longProfitLoss: '+8.59%',
                  sortProfitLoss: '+5.37%',
                ),
                SizedBoxView(height: 10.v),
                FllActivityWidget(
                  optionType: 'Future',
                  netQty: '15,261',
                  qtyType: 'Bullish',
                  longOl: '+9,366',
                  shortOl: '+5,454',
                  longProfitLoss: '+8.59%',
                  sortProfitLoss: '+5.37%',
                ),
                SizedBoxView(height: 20.v),
                Consumer<ThemeModel>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Fll-Dll BUY/SELL activity on",
                          style: TextStyle(fontSize: 23.h),
                        ),
                        Text(
                          ("${value.date.day}-${value.date.month}-${value.date.year}")
                              .toString(),
                          style: TextStyle(fontSize: 23.h),
                        ),
                      ],
                    );
                  },
                ),
                SizedBoxView(height: 20.v),
                StockWidget(
                  context: context,
                  optionType: 'Stocks',
                  fllPrice: '+639.97 Cr',
                  dllPrice: '+639.97 Cr',
                  netPrice: '+639.97 Cr',
                ),
                SizedBoxView(height: 10.v),
                FutureWidget(
                  context: context,
                  optionType: 'Future',
                  fllPrice: '+639.97 Cr',
                  outstandingFllFUTOlAmt: '25,487.67 Cr',
                ),
                SizedBoxView(height: 10.v),
                FllDataButtonWidget(
                    context: context, title: 'View Daywise data',
                    onTap: () {

                      Navigator.pushNamed(context, AppRoutes.dayWishDataWidget);

                    }),
                SizedBoxView(height: 20.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
