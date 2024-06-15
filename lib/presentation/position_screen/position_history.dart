import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';

import '../basket_orders_screen/position_history_ListView_custome.dart';
import 'Widget/position_history_screen_widget.dart';

class PositionHistory extends StatefulWidget {
  @override
  State<PositionHistory> createState() => _PositionHistoryState();
}

class _PositionHistoryState extends State<PositionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
            text: MyString.position_history, textColor: AppColors.white),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  height: 120.h,
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_month,
                            color: AppColors.white, size: 23.h),
                      ),
                      TextView(
                        text: "March 2024",
                        textColor: AppColors.white,
                        textSize: 20.h,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 20,
                  margin: EdgeInsets.only(left: 30.h, right: 30.h, top: 70.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: 80.h,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder7,
                        border: Border.all(color: AppColors.white),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.v),
                          Text(
                            MyString.history_total_PL,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(right: 2.h),
                              child: Text(
                                "-2044.65",
                                style: CustomTextStyles.bodyMediumRedA700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBoxView(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  child: netPLAndTotalChargesWidget(
                      name: MyString.history_NetPL, value: '0.00'),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  child: netPLAndTotalChargesWidget(
                      name: MyString.history_Total_charges, value: '0.00'),
                ),
              ],
            ),
            SizedBoxView(height: 5),
            DividerView(),
            SizedBoxView(height: 5),
            ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.grey,
                );
              },
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return position_history_ListView_custom(
                  leftTitle: '0 Qty.',
                  leftTitleBackgroundColor: AppColors.blackShade10,
                  leftTitleBorderColor: AppColors.blackShade10,
                  Avg: 'Avg 0.00',
                  rightTitle: 'Closed',
                  rightTitleBackgroundColor: AppColors.green3,
                  rightTitleBorderColor: AppColors.green,
                  rightTitleTextColor: AppColors.blackShade10,
                  optionName: 'BANKNIFTY 45400 PE',
                  date: "29-Feb-2024",
                  ltp: "3548.15",
                  value: '3548.15',
                  exitedDatePrice: '2,737.55',
                  cheMainTitle: false,
                  exitedAtCheck: false,
                );
              },
            ),
            SizedBoxView(height: 5),
            DividerView(),
          ],
        ),
      ),
    );
  }
}
