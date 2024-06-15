import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/app_export.dart';

// ignore: must_be_immutable
class StockinfolistItemWidget extends StatelessWidget {
  const StockinfolistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.placeOrderScreen);
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 100.h,
              margin: EdgeInsets.only(
                left: 13.h,
                top: 10.v,
              ),
              child: Text(
                "NIFTY 17500 CE\n16-Nov WEEKLY",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                //style: theme.textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 10.v),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 19.h),
                      child: Text(
                        "2044.65",
                        style: CustomTextStyles.bodyMediumRedA700,
                      ),
                    ),
                  ),
                  Text(
                    "-469.10(-18.86%)",
                    // style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
             CustomImageView(
              imagePath: ImageConstant.img360F519342702,
              height: 33.v,
              width: 37.h,
              margin: EdgeInsets.only(
                left: 5.h,
                top: 10.v,
              ),
            ),/*
            SvgPicture.asset(
              ImageConstant.img360F519342702svg,
              height: 33.v,
              width: 37.h,
              color: Colors.green,
            )*/
          ],
        ),
      ),
    );
  }
}
