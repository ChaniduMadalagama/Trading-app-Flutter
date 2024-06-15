import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

// ignore: must_be_immutable
class StockdetailsItemWidget extends StatelessWidget {
  const StockdetailsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.h,
        vertical: 6.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: EdgeInsets.all(0),
                      color: appTheme.whiteA700,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: appTheme.blueGray100,
                          width: 1.h,
                        ),
                        borderRadius: BorderRadiusStyle.circleBorder13,
                      ),
                      child: Container(
                        height: 26.v,
                        width: 97.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 23.h),
                        decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder13,
                            color: Theme.of(context).colorScheme.secondary),
                        child: Text(
                          "0 Qty.",
                          style: CustomTextStyles.titleSmallGreenA700,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.v),
                    Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 6.v,
                          bottom: 3.v,
                        ),
                        child: Text(
                          "Avg. 100.78",
                          //style: CustomTextStyles.labelMediumManropeOnErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.v),
                Container(
                  width: 99.h,
                  margin: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "NIFTY 17500 CE\n16-Nov NFO",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    //  style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: appTheme.whiteA700,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: appTheme.blueGray100,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadiusStyle.circleBorder13,
                  ),
                  child: Container(
                    height: 26.v,
                    width: 97.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.h,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder13,
                        color: Theme.of(context).colorScheme.secondary),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 19.v,
                            width: 48.h,
                            decoration: BoxDecoration(
                                //color: appTheme.whiteA700,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.h),
                            child: Text(
                              "Close",
                              style: CustomTextStyles.titleSmallPink500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                Padding(
                  padding: EdgeInsets.only(right: 17.h),
                  child: Text(
                    "2044.65",
                    style: CustomTextStyles.bodyMediumRedA700,
                  ),
                ),
                SizedBox(height: 2.v),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder7,
                      color: Theme.of(context).colorScheme.secondary),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          "LTP",
                          // style: theme.textTheme.labelSmall,
                          style: TextStyle(fontSize: 10.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: Text(
                          "2044.65",
                          style: CustomTextStyles.bodySmallRedA700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
