import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/App.dart';
import '../../../widgets/TextView.dart';
import 'option_chain_listview_widget.dart';

Widget TotalOptionPrice() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.grey,
    ),
    child: Row(
      children: [
        callOlPrice(
          boxHeight: 55.h,
          bottomValue: MyString.option_Change,
          topValue: MyString.callOi,
          type: 'calloi',
          color: AppColors.green6,
        ),
        totalPriceWidget(
          boxHeight: 55.h,
          topValue: '2398.45',
          bottomValue: '+2.72%',
        ),
        StrikeWidget(boxHeight: 40.h, totalPrice: MyString.total),
        totalPriceWidget(
          boxHeight: 55.h,
          topValue: '2398.45',
          bottomValue: '+2.72%',
        ),
        callOlPrice(
          boxHeight: 55.h,
          bottomValue: MyString.option_Change,
          topValue: MyString.putOi,
          type: 'putoi',
          color: AppColors.redShade6,
        ),
      ],
    ),
  );
}

Widget callOlPrice({
  required double boxHeight,
  required String topValue,
  required String bottomValue,
  required String type,
  required Color color,
}) {
  return Expanded(
    flex: 1,
    child: Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
        color: color,
        //color: AppColors.greenShade1,
        borderRadius: type == "calloi"
            ? BorderRadius.only(
                topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            : BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
        border: type == "calloi" ?  Border.all(color: AppColors.green) :  Border.all(color: AppColors.red)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: type == "calloi"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          TextView(text: topValue, textColor: AppColors.black, textSize: 14.h),
          DividerView(thickness: 1),
          TextView(
              text: bottomValue, textColor: AppColors.black, textSize: 14.h),
        ],
      ),
    ),
  );
}

Widget totalPriceWidget(
    {required double boxHeight,
    required String topValue,
    required String bottomValue}) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
          // color: AppColors.greenShade1,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(text: topValue, textColor: AppColors.black, textSize: 14.h),
          DividerView(indent: 5, endIndent: 5, thickness: 1),
          TextView(
              text: bottomValue, textColor: AppColors.black, textSize: 14.h),
        ],
      ),
    ),
  );
}
