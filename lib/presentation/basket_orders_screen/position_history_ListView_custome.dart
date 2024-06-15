import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../core/utils/ColorFile.dart';
import '../../theme/app_decoration.dart';

Widget position_history_ListView_custom({
  required String leftTitle,
  required Color leftTitleBackgroundColor,
  required Color leftTitleBorderColor,
  required String Avg,
  required String rightTitle,
  required Color rightTitleBackgroundColor,
  required Color rightTitleTextColor,
  required Color rightTitleBorderColor,
  required String optionName,
  required String value,
  required String date,
  required String ltp,
  required String exitedDatePrice,
  required bool cheMainTitle,
  required bool exitedAtCheck,
}) {
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        cheMainTitle == true ? SizedBox(height: 5) : SizedBox(height: 0),
        cheMainTitle == true
            ? Row(
                children: [
                  Spacer(),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                        ),
                        border: Border.fromBorderSide(
                            BorderSide(color: AppColors.black)),
                        color: AppColors.blackShade10,
                      ),
                      child: Text(
                        "Pending Order",
                        style: CustomTextStyles.titleSmallPrimary.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(height: 0),
        // SizedBox(height: 5),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 1.v,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),
                ],
                border: Border.fromBorderSide(
                    BorderSide(color: leftTitleBorderColor)),
                color: leftTitleBackgroundColor,
              ),
              child: Text(
                leftTitle,
                style: CustomTextStyles.titleSmallPrimary.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text("$Avg"),
            Spacer(),
            Card(
              elevation: 4,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.outlineBlueGray.copyWith(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(color: rightTitleBorderColor, width: 1.2),
                  ),
                  color: rightTitleBackgroundColor,
                ),
                child: Text(
                  rightTitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: rightTitleTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Text(
                optionName,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              exitedAtCheck == true
                  ? Text(
                      "Exited at : $exitedDatePrice",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.outlineBlueGray.copyWith(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.grey),
                  ),
                  color: AppColors.white,
                ),
                child: Text(
                  "LTP $ltp",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
