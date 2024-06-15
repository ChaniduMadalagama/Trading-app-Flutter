import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/App.dart';
import '../../../widgets/TextView.dart';

class FllActivityWidget extends StatelessWidget {

  String optionType;
  String netQty;
  String qtyType;
  String longOl;
  String shortOl;
  String longProfitLoss;
  String sortProfitLoss;

   FllActivityWidget({
     required this.optionType,
     required this.longOl,
     required this.netQty,
     required this.qtyType,
     required this.shortOl,
     required this.longProfitLoss,
     required this.sortProfitLoss,
});


@override
Widget build(BuildContext context) {
  return Card(
    elevation: 10,
    color: AppColors.white,
    child: Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextView(text: optionType, textSize: 17.h,textColor: AppColors.black),
              Spacer(),
              TextView(text: "Net",textSize: 15.h,textColor: AppColors.black),
              SizedBoxView(width: 4),
              TextView(text: netQty, textSize: 16.h,textColor: AppColors.black),
              SizedBoxView(width: 5),
              TextView(
                  text: qtyType, textSize: 12.h, textColor: qtyType == "Bullish" ? AppColors.green : AppColors.red),
            ],
          ),
          SizedBoxView(height: 20.v),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "Long Ol charge", fontWeight: FontWeight.w300,textSize: 15.h,textColor: AppColors.black),
                  Row(
                    children: [
                      TextView(text:longOl,textSize: 14.h,textColor: AppColors.black),
                      TextView(text:longProfitLoss,textColor: AppColors.green,textSize: 14.h),
                    ],
                  ),
                  TextView(text: "Long Buildup", fontWeight: FontWeight.w300,textColor: AppColors.black),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "Short Ol charge", fontWeight: FontWeight.w300,textSize: 15.h,textColor: AppColors.black),
                  Row(
                    children: [
                      TextView(text:shortOl,textSize: 14.h,textColor: AppColors.black),
                      TextView(text:sortProfitLoss,textColor: AppColors.green,textSize: 14.h),
                    ],
                  ),
                  TextView(text: "Short Buildup", fontWeight: FontWeight.w300,textSize: 14.h,textColor: AppColors.black),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}
