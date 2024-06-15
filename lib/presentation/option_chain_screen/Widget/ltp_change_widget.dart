import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/App.dart';
import '../../../widgets/TextView.dart';

Widget ltpChangeWidget({required double boxHeight})
{
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(text: MyString.LTP, textSize: 12.h,textColor: AppColors.black),
          DividerView(indent: 5, endIndent: 5, thickness: 1),
          TextView(text: MyString.option_Change1,textSize: 12.h, textColor: AppColors.black),
        ],
      ),
    ),
  );
}