import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/selling_screen/Widget/PositionScreenListViewWidget.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';

class SellingScreen extends StatelessWidget {
  const SellingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      //  appBar: _buildAppBar(context),
       /* body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 34.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 62.h,
                    right: 35.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 114.h,
                    vertical: 16.v,
                  ),
                  decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder7,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 5.v),
                      Text(
                        "Total P&L",
                        style: theme.textTheme.titleSmall,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 2.h),
                          child: Text(
                            "2044.65",
                            style: CustomTextStyles.bodyMediumRedA700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.v),
                Divider(),
                SizedBox(height: 5.v),
                _buildViewRow(context),
                SizedBox(height: 2.v),
                _buildNiftyCeRow(context),
                SizedBox(height: 7.v),
                Divider(),
                SizedBox(height: 5.v),
                _buildCloseRow(context),
                SizedBox(height: 13.v),
                Divider(
                  endIndent: 9.h,
                ),

              ],
            ),
          ),
        ),*/
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*SizedBoxView(height: 40),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: TextView(
                    text: MyString.position,
                    textSize: 20,
                    fontWeight: FontWeight.w600,
                  )),*/
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.black12
                  ),
                  child: Column(
                    children: [
                      Text(
                         MyString.totalPL,
                      ),
                      Text(
                       '2044.65',
                        style: TextStyle(color: AppColors.red),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: AppColors.black26,
                        ),
                        PositionScreenListViewWidget(
                          titleName: 'NIFTY 17500 CE',
                          subTitleName: '16-Nov NFO',
                          price: '2044.65',
                          lpt:'2044.65',
                          ipoOpenClose: 'Open',
                          date: 'Avg. 100.78',
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: AppColors.black26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Position",
        margin: EdgeInsets.only(left: 18.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildViewRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
              padding: EdgeInsets.symmetric(horizontal: 21.h),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder13,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 19.v,
                      width: 48.h,
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "50 Qty.",
                      style: CustomTextStyles.titleSmallGreenA700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                top: 6.v,
                bottom: 3.v,
              ),
              child: Text(
                "Avg. 100.78",
                style: CustomTextStyles.labelMediumManropeOnErrorContainer,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 26.v,
            width: 101.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup44513,
                  height: 26.v,
                  width: 101.h,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 21.v,
                    width: 48.h,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 19.v,
                            width: 48.h,
                            decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "Open",
                              style: CustomTextStyles.titleSmallPrimary,
                            ),
                          ),
                        ),
                      ],
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

  /// Section Widget
  Widget _buildNiftyCeRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 9.h,
        right: 3.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 99.h,
            margin: EdgeInsets.only(top: 3.v),
            child: Text(
              "NIFTY 17500 CE\n16-Nov NFO",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 180.h,
              bottom: 2.v,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: Text(
                      "2044.65",
                      style: CustomTextStyles.bodyMediumRedA700,
                    ),
                  ),
                ),
                SizedBox(height: 4.v),
                _buildFrame(
                  context,
                  dynamicText: "LTP",
                  dynamicText1: "2044.65",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCloseRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 172.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.all(0),
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
                          padding: EdgeInsets.symmetric(horizontal: 21.h),
                          decoration: AppDecoration.outlineBluegray100.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder13,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 19.v,
                                  width: 48.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "50 Qty.",
                                  style: CustomTextStyles.titleSmallGreenA700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 6.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            "Avg. 100.78",
                            style: CustomTextStyles
                                .labelMediumManropeOnErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.v),
                Container(
                  width: 99.h,
                  margin: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "NIFTY 17500 CE\n16-Nov NFO",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomOutlinedButton(
                height: 26.v,
                width: 97.h,
                text: "Close",
                buttonStyle: CustomButtonStyles.outlineBlueGray,
                buttonTextStyle: CustomTextStyles.titleSmallPink500,
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
              _buildFrame(
                context,
                dynamicText: "LTP",
                dynamicText1: "2044.65",
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Opacity(
            opacity: 0.5,
            child: Text(
              dynamicText,
              style: theme.textTheme.labelSmall!.copyWith(
                color: theme.colorScheme.onErrorContainer.withOpacity(0.53),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Text(
              dynamicText1,
              style: CustomTextStyles.bodySmallRedA700.copyWith(
                color: appTheme.redA700,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
