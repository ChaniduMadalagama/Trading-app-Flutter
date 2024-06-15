import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/App.dart';
import '../../../widgets/TextView.dart';

Widget FutureWidget({
  context,
  required String optionType,
  required String fllPrice,
  required String outstandingFllFUTOlAmt,
}) {
  return Card(
    elevation: 10,
    color: AppColors.white,
    child: Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
              text: optionType, textSize: 17.h, textColor: AppColors.black),
          SizedBoxView(height: 20.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: "Fll",
                      fontWeight: FontWeight.w500,
                      textSize: 15.h,
                      textColor: AppColors.black),
                  TextView(
                      text: "${MyString.rupeeSymbol}$fllPrice",
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.green,
                      textSize: 14.h),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: "Outstanding Fll FUT Ol Amt.",
                      fontWeight: FontWeight.w500,
                      textSize: 15.h,
                      textColor: AppColors.black),
                  TextView(
                      text: "${MyString.rupeeSymbol}$outstandingFllFUTOlAmt",
                      fontWeight: FontWeight.w300,
                      textSize: 14.h,
                      textColor: AppColors.black),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget StockWidget({
  context,
  required String optionType,
  required String fllPrice,
  required String dllPrice,
  required String netPrice,
}) {
  return Card(
    elevation: 10,
    color: AppColors.white,
    child: Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
              text: optionType, textSize: 17.h, textColor: AppColors.black),
          SizedBoxView(height: 20.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: "FII",
                      fontWeight: FontWeight.w500,
                      textSize: 15.h,
                      textColor: AppColors.black),
                  TextView(
                      text: "${MyString.rupeeSymbol}$fllPrice",
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.green,
                      textSize: 14.h),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: "DII",
                      fontWeight: FontWeight.w500,
                      textSize: 15.h,
                      textColor: AppColors.black),
                  TextView(
                      text: "${MyString.rupeeSymbol}$fllPrice",
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.green,
                      textSize: 14.h),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: "NET",
                      fontWeight: FontWeight.w500,
                      textSize: 15.h,
                      textColor: AppColors.black),
                  TextView(
                      text: "${MyString.rupeeSymbol}$fllPrice",
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.green,
                      textSize: 14.h),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
