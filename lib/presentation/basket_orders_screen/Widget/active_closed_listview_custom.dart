import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../core/utils/image_constant.dart';
import '../../../theme/app_decoration.dart';
import '../../../widgets/App.dart';

Widget activeClosedListViewCustom({
  required String basketTitle,
  required String rightTitle,
  required Color rightTitleBackgroundColor,
  required Color rightTitleTextColor,
  required Color rightTitleBorderColor,
  required String date,
  required String item,
}) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 10),
            child: /*SvgPicture.asset(
              ImageConstant.imgPngBasketSvg,
              height: 25.v,
              width: 25.h,
            ),*/
                Image.asset(
              ImageConstant.basketIcon,
              height: 25.v,
              width: 25.h,
            ),
          ),
          SizedBoxView(width: 10.h),
          Text(
            basketTitle,
            style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 17.h,
              vertical: 1.v,
            ),
            decoration: AppDecoration.outlineBlueGray.copyWith(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              border: Border.fromBorderSide(
                  BorderSide(color: rightTitleBorderColor)),
              color: rightTitleBackgroundColor,
            ),
            child: Text(
              rightTitle,
              style: CustomTextStyles.titleSmallPrimary.copyWith(
                color: rightTitleTextColor,
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 45.h),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.UsernameColor,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: Text(
              "$item item",
//  style: theme.textTheme.titleSmall,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.UsernameColor,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
