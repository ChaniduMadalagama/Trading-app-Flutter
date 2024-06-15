import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/month_summary_screen/Widget/dialog_box_widget.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthSummaryScreen extends StatefulWidget {
  @override
  State<MonthSummaryScreen> createState() => _MonthSummaryScreenState();
}

class _MonthSummaryScreenState extends State<MonthSummaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  final calendarController = CleanCalendarController(
    minDate: DateTime(2024, 2, 1),
    maxDate: DateTime(2024, 2, 29),
    onDayTapped: (date) {
      print("Date >>>> ${date.day}");
    },
    readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    rangeMode: true,
/*     initialFocusDate: DateTime.now(),
     initialDateSelected: DateTime.now(),
     endDateSelected: DateTime.now(),*/
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            TextView(text: MyString.month_summary, textColor: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBoxView(height: 10),
              Stack(
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(color: AppColors.appColor),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2)),
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.width - 10,
                      child: TableCalendar(
                        firstDay: DateTime.utc(2024, 2, 1),
                        lastDay: DateTime.utc(2024, 2, 29),
                        focusedDay: DateTime.utc(2024, 2, 29),
                        onDaySelected: (selectedDay, focusedDay) {
                          print(selectedDay.day);
                          monthSummaryDialogBox(
                            context: context,
                            totalPnL: 64540.87,
                            totalCharges: 4143.96,
                            netPnL: 68684.84,
                            check: 0,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxView(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      TextView(text: MyString.total_pl),
                      TextView(text: MyString.rupeeSymbol + " 0.00"),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      chargesBreakupDailog(
                        totalbrokeragePrice: 340.00,
                        sttCttPrice: 216.51,
                        transactionChargesPrice: 4326.87,
                        gstPrice: 839.78,
                        sebiChargePrice: 8.10,
                        stampChargePrice: 231.76,
                        totalChargePrice: 5963.02,
                      );
                    },
                    child: Column(
                      children: [
                        TextView(text: MyString.total_charges),
                        TextView(text: MyString.rupeeSymbol + " 0.00"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      TextView(text: MyString.net_pl),
                      TextView(text: MyString.rupeeSymbol + " 0.00"),
                    ],
                  ),
                ],
              ),
              SizedBoxView(height: 10),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: TextView(
                  text: MyString.recent_performance,
                  textSize: 25.h,
                  fontWeight: FontWeight.w800,
                ),
              ),
              DividerView(
                  color: AppColors.black,
                  thickness: 1,
                  endIndent: 10,
                  indent: 10),
              SizedBoxView(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.white,
                    elevation: 10,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: InkWell(
                      onTap: () {
                        monthSummaryDialogBox(
                          context: context,
                          totalPnL: 64540.87,
                          totalCharges: 4143.96,
                          netPnL: 68684.84,
                          check: 1,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(text: "12 February 2024"),
                            TextView(
                                text: MyString.rupeeSymbol + " 68,684.84",
                                textColor: AppColors.red),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBoxView(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  monthSummaryDialogBox({
    required double totalPnL,
    required double totalCharges,
    required double netPnL,
    required context,
    required check,
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
                  borderRadius: BorderRadius.all(Radius.circular(12.0.h))),
              title: Center(
                child: Text(
                  MyString.daySummary,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: TextView(
                                  text: "20 feb 2024",
                                  textSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            check == 1
                                ? Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text: MyString.total_PnL,
                                              textSize: 16.h,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            TextView(
                                              text: totalPnL == null
                                                  ? "00.00"
                                                  : totalPnL.toString(),
                                              textSize: 16.h,
                                              fontWeight: FontWeight.w400,
                                              textColor: totalPnL == null
                                                  ? Colors.grey
                                                  : totalPnL < 0
                                                      ? AppColors.red
                                                      : AppColors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text: MyString.total_chargers,
                                              textSize: 16.h,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            TextView(
                                              text:
                                                  "${totalCharges > 0 ? "+" : ""}${totalCharges == null ? "00" : totalCharges.toStringAsFixed(2)}",
                                              textColor: totalCharges == null
                                                  ? Colors.grey
                                                  : totalCharges < 0
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
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text: MyString.NetPnL,
                                              textSize: 16.h,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            TextView(
                                              text:
                                                  "${netPnL > 0 ? "+" : ""}${netPnL.toStringAsFixed(2)}",
                                              textColor: netPnL == null
                                                  ? Colors.grey
                                                  : netPnL < 0
                                                      ? AppColors.red
                                                      : AppColors.green,
                                              textSize: 16.h,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.only(right: 10, left: 10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    height: 50,
                                    child: TextView(
                                      text: MyString.notTakenAnyTrade,
                                      textSize: 16.h,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxView(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.positionHistory);
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                        ),
                        child: TextView(text: MyString.viewAllPositions),
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

  chargesBreakupDailog({
    required double totalbrokeragePrice,
    required double sttCttPrice,
    required double transactionChargesPrice,
    required double gstPrice,
    required double sebiChargePrice,
    required double stampChargePrice,
    required double totalChargePrice,
  }) {
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Dialog(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(19),
                                topRight: Radius.circular(20)),
                          ),
                          padding: EdgeInsets.only(right: 10, left: 10),
                          height: 50,
                          child: Center(
                            child: Text(
                              "Charges breakup",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: 10, left: 10),
                              color: Theme.of(context).colorScheme.secondary,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "Brokerage (₹20/order)",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        totalbrokeragePrice.toString(),
                                    textColor: AppColors.red,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "STT/CTT",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        sttCttPrice.toString(),
                                    textColor: AppColors.red,
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
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "Transaction charges",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        transactionChargesPrice.toString(),
                                    textColor: AppColors.red,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "GST",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        gstPrice.toString(),
                                    textColor: AppColors.red,
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Theme.of(context).colorScheme.secondary,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: 10, left: 10),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "SEBI charges",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        sebiChargePrice.toString(),
                                    textColor: AppColors.red,
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
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "Stamp charges",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        stampChargePrice.toString(),
                                    textColor: AppColors.red,
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: 10, left: 10),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: "Total charges",
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  TextView(
                                    text: MyString.rupeeSymbol +
                                        totalChargePrice.toString(),
                                    textColor: AppColors.red,
                                    textSize: 16.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.onBackground,
            ),
          );
        },
      );
    }
  }
}
