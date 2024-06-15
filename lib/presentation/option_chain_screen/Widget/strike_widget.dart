import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/TextView.dart';

Widget strikeWidget({required double boxHeight}) {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      height: boxHeight,
      decoration: BoxDecoration(
          color: AppColors.white, border: Border.all(color: AppColors.black)),
      child: TextView(text: MyString.strike, textColor: AppColors.black),
    ),
  );
}
