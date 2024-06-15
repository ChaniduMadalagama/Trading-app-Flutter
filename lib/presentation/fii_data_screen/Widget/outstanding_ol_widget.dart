import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';

class OutstandingOlWidget extends StatelessWidget {
  String optionType;
  String netQty;
  String qtyType;
  String longOl;
  String shortOl;

  OutstandingOlWidget({
    required this.optionType,
    required this.longOl,
    required this.netQty,
    required this.qtyType,
    required this.shortOl,
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
                TextView(text: "Net", textSize: 9.h,textColor: AppColors.black/*textColor: AppColors.black*/),
                SizedBoxView(width: 4),
                TextView(text: netQty, textSize: 16.h,textColor: AppColors.black/*textColor: AppColors.black*/),
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
                    TextView(text: "Long Ol", fontWeight: FontWeight.w300,textColor: AppColors.black/*textColor: AppColors.black*/),
                    TextView(text:longOl,textColor: AppColors.black/*textColor: AppColors.black*/),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(text: "Short Ol", fontWeight: FontWeight.w300,textColor: AppColors.black/*,textColor: AppColors.black*/),
                    TextView(text: shortOl,textColor: AppColors.black/*textColor: AppColors.black*/),
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
