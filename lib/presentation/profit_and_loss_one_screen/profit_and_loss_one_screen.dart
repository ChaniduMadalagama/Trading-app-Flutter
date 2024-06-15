import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';

import 'package:prayas_capital/core/utils/ColorFile.dart';

class ProfitAndLossOneScreen extends StatelessWidget {
  const ProfitAndLossOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        //appBar: _buildAppBar(context),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
      //    backgroundColor: AppColors.appColor,
          title: Text(
            "Profit And Loss",
            style: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w500,color: AppColors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
             // width: 364.h,
              margin: EdgeInsets.fromLTRB(18.h, 19.v, 8.h, 5.v),
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
                vertical: 8.v,
              ),
              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder7,
                border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
                color: Theme.of(context).colorScheme.onBackground
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6.v),
                        child: Column(
                          children: [
                            Text(
                              "Realized P & L",
                            //  style: theme.textTheme.titleSmall,
                            ),
                            Text(
                              "₹2044.65",

                              style: CustomTextStyles.bodyMediumRedA700,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.v,right: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Charges",
                             // style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(height: 3.v),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "₹95.09",
                              //  style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.v),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.h,
                      vertical: 6.v,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 13.h,
                      vertical: 6.v,
                    ),
                    decoration: AppDecoration.outlineBlack9001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder7,
                      border: Border.all(color: Theme.of(context).colorScheme.onSecondary)
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                "Net Realized P&L",
                               style: TextStyle(fontSize: 15.h),
                               // style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              "=Realized P&l - Charges",
                              style: TextStyle(fontSize: 15.h),
                              //style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                        Spacer(),
                        Text("\u{20B9}"),
                        Text(
                          "2044.65",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.v),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
