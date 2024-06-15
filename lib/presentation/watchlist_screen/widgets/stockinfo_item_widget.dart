import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

// ignore: must_be_immutable
class StockinfoItemWidget extends StatelessWidget {
  const StockinfoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 3.h,
        vertical: 9.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 99.h,
            child: Text(
              "NIFTY 17500 CE\n16-Nov NFO",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 163.h),
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
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
