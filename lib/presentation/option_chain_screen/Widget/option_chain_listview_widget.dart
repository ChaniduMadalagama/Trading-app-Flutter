import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/size_utils.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';

Widget OlOptionChainWidget({required double boxHeight,
  required String topValue,
  required String bottomValue}) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        //  border: Border.all(color: AppColors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextView(text: topValue, textColor: AppColors.black,textSize: 14.h),
          DividerView(thickness: 1),
          TextView(text: bottomValue, textColor: AppColors.black,textSize: 14.h),
        ],
      ),
    ),
  );
}

Widget LtpOptionChainWidget({required double boxHeight,
  required String topValue,
  required String bottomValue}) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(text: topValue, textColor: AppColors.black,textSize: 14.h),
          DividerView(indent: 5, endIndent: 5, thickness: 1),
          TextView(text: bottomValue, textColor: AppColors.black,textSize: 14.h),
        ],
      ),
    ),
  );
}

Widget StrikeWidget({required double boxHeight , required String totalPrice}) {
  return Expanded(
    flex: 1,
    child: Container(
        alignment: Alignment.center,
        height: boxHeight,
        decoration: BoxDecoration(
          color: AppColors.black,),
    child: TextView(text: totalPrice, textColor: AppColors.white,textSize: 14.h),
  )
  ,
  );
}
