import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';

import 'package:prayas_capital/core/utils/ColorFile.dart';
import '../trades_and_charges_screen/widgets/stockdetails_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

class TradesAndChargesScreen extends StatelessWidget {
  const TradesAndChargesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),

          title: Text(
            "Trades And Charges",
            style: TextStyle(
                fontSize: 21.h,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 24.v),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.monthSummrayIcon,
                    height: 30.h,
                    width: 30.h,
                  ),/*Image.asset(
                    ImageConstant.basketIcon,
                    height: 30.h,
                    width: 30.h,
                  ),*/
                  SizedBoxView(width: 10.h),
                  Text(
                    "13 November 2023",
                    //style: theme.textTheme.titleLarge,
                    style: TextStyle(fontSize: 18.h),
                  ),
                ],
              ),
              SizedBox(height: 29.v),
              _buildRealizedPL(context),
              SizedBox(height: 25.v),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: _buildStockDetails(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRealizedPL(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 18.h,
        right: 8.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary)),
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
                      MyString.realized_PL,
                      //style: theme.textTheme.titleSmall,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 14.h),
                    ),
                    Text(
                      "₹2044.65",
                      style: CustomTextStyles.bodyMediumRedA700,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyString.Charges,
                        //style: theme.textTheme.titleSmall,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 15.h)),
                    SizedBox(height: 3.v),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Text("₹95.09",
                          //style: theme.textTheme.bodyMedium,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 12.h)),
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
              border: Border.all(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
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
                      child: Text(MyString.Net_Realized_PL,
                          //  style: theme.textTheme.titleMedium,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 17.h)),
                    ),
                    Text(MyString.Realized_Pl_Charges,
                        //style: theme.textTheme.labelLarge,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 13.h)),
                  ],
                ),
                Spacer(),
                Text(MyString.rupeeSymbol,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 13.h)),
                Text(
                  " 2044.65",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStockDetails(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0.v),
          child: SizedBox(
            width: 10.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              //color: appTheme.gray300,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return StockdetailsItemWidget();
      },
    );
  }
}
