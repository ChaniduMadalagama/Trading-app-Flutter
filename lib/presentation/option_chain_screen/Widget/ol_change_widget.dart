import 'package:flutter/material.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/core/utils/size_utils.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/App.dart';
import '../../../widgets/TextView.dart';

Widget OlChangewidget({required double boxHeight}) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
          color: AppColors.white, border: Border.all(color: AppColors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(text: MyString.ol_Lots, textSize: 12.h,textColor: AppColors.black),
          DividerView(indent: 5, endIndent: 5, thickness: 1),
          TextView(text: MyString.option_Change,textSize: 12.h, textColor: AppColors.black),
        ],
      ),
    ),
  );
}

Widget OlChangeWidgetListView({required double boxHeight}) {
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
        children: [
          TextView(text: MyString.ol_Lots,textSize: 12.h, textColor: AppColors.black),
          DividerView(indent: 5, endIndent: 5, thickness: 1),
          TextView(text: MyString.option_Change, textSize: 12.h,textColor: AppColors.black),
        ],
      ),
    ),
  );
}
