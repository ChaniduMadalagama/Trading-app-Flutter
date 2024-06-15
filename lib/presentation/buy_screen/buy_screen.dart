import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/ButtonView.dart';
import 'package:prayas_capital/widgets/TextFielsView.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:prayas_capital/widgets/custom_elevated_button.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class BuyScreen extends StatelessWidget {
  BuyScreen({Key? key}) : super(key: key);

  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController triggerController = TextEditingController();

  TextEditingController stopLossvalueController = TextEditingController();

  TextEditingController triggerPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
      child: SizedBox(
          width: double.maxFinite,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    _buildBuy1(context),
                    SizedBox(height: 16.v),
                    DividerView(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    SizedBox(height: 25.v),
                    Container(
                      margin: EdgeInsets.only(left: 15.v),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Type",
                        /*style: CustomTextStyles.bodyMedium14*/
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 15.h),
                      ),
                    ),
                    SizedBox(height: 6.v),
                    // _buildFiftySix(context),
                    Container(
                      margin: EdgeInsets.only(left: 20.h, right: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 3,
                            child: ButtonView(
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 4,
                              onTap: () {},
                              buttonName: 'Market',
                              textColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              borderRadiuss: 8.h,
                              borderColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              buttonColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Card(
                            elevation: 3,
                            child: ButtonView(
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 4,
                              onTap: () {},
                              buttonName: 'Limit',
                              textColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              borderRadiuss: 8.h,
                              borderColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              buttonColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Card(
                            elevation: 3,
                            child: ButtonView(
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 4,
                              onTap: () {},
                              buttonName: 'Stop Loss',
                              textColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              borderRadiuss: 8.h,
                              borderColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              buttonColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.v),
                    DividerView(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    SizedBox(height: 20.v),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.h),
              child: Text(
                "Trigger",
                //    style: CustomTextStyles.bodyMedium14,
                style: TextStyle(fontSize: 15.h),
              ),
            ),
            SizedBox(height: 8.v),
            _buildTriggerPrice(context),
            SizedBox(height: 24.v),
            _buildMargin(context),
            SizedBox(height: 55.v),
            _buildSwipeToBuy(context),
            SizedBox(height: 5.v)
          ])),
    )));
  }

  /// Section Widget
  Widget _buildBuy(BuildContext context) {
    return CustomElevatedButton(
        height: 43.v,
        width: 114.h,
        text: "Buy",
        buttonStyle: CustomButtonStyles.fillGreenA,
        buttonTextStyle: CustomTextStyles.titleSmallWhiteA700);
  }

  /// Section Widget
  Widget _buildSell(BuildContext context) {
    return CustomElevatedButton(
        height: 43.v,
        width: 114.h,
        text: "Sell",
        margin: EdgeInsets.only(left: 20.h),
        buttonStyle: CustomButtonStyles.fillRedA,
        buttonTextStyle: CustomTextStyles.titleSmallWhiteA700);
  }

  /// Section Widget
  Widget _buildStopLossvalue(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: quantityController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: '50',
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: priceController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: '50',
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBuy1(BuildContext context) {
    return SizedBox(
      // height: 342.v,
      width: double.maxFinite,
      child: Container(
        //margin: EdgeInsets.only(left: 20.v,right: 10.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.customBorderTL20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.v),
            Container(
              margin: EdgeInsets.only(left: 20.v, right: 20.v, top: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      ImageConstant.imgClose,
                        color: Theme.of(context).colorScheme.onSecondary
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 63.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NIFTY NOV 19400 CE",
                          //    style: CustomTextStyles.titleMediumOnErrorContainerBold
                          style: TextStyle(
                              fontSize: 19.h, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 2.v),
                        Text(
                          "NFO 223.00 +1.40 (+0.63)",
                          //    style: theme.textTheme.bodyMedium,
                          style: TextStyle(fontSize: 13.h),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.v),
            DividerView(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            SizedBox(height: 22.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBuy(context),
                _buildSell(context),
              ],
            ),
            SizedBox(height: 23.v),
            DividerView(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            SizedBox(height: 14.v),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20.v, right: 20.v),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSixtySeven(context,
                      lowText: "Open", numberText: "95.00"),
                  //  Spacer(flex: 30),
                  _buildSixtySeven(context,
                      lowText: "High ", numberText: "224.65"),
                  //  Spacer(flex: 30),
                  _buildSixtySeven(context,
                      lowText: "Low", numberText: "224.65"),
                  //  Spacer(flex: 30),

                  _buildSixtySeven(context,
                      lowText: "Prev.Close", numberText: "224.65"),
                  _buildSixtySeven(context,
                      lowText: "Lot Size", numberText: "50"),
                ],
              ),
            ),
            SizedBox(height: 15.v),
            DividerView(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            SizedBox(height: 9.v),
            Container(
              margin: EdgeInsets.only(left: 20.v, right: 20.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Quantity",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                )),
                            SizedBoxView(width: 5.h),
                            Text("Lot size",
                                style: TextStyle(
                                    color: AppColors.greyShade8,
                                    fontSize: 10.h)),
                            Text(
                              "50",
                              style: TextStyle(
                                  color: AppColors.greyShade8, fontSize: 10.h),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.v),
                        _buildStopLossvalue(context)
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price",
                            ),
                            SizedBoxView(width: 5.h),
                            Text("Tick size 0.05",
                                style: TextStyle(
                                    color: AppColors.greyShade8,
                                    fontSize: 10.h))
                          ]),
                      SizedBox(height: 8.v),
                      _buildPrice(context)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMarket(BuildContext context) {
    return CustomOutlinedButton(
        height: 36.v,
        width: 99.h,
        text: "Market",
        buttonStyle: CustomButtonStyles.outlineBlackTL8,
        buttonTextStyle: CustomTextStyles.bodyMedium14);
  }

  /// Section Widget
  Widget _buildStopLoss(BuildContext context) {
    return CustomOutlinedButton(
        height: 36.v,
        width: 99.h,
        text: "Stop Loss",
        margin: EdgeInsets.only(left: 25.h),
        buttonStyle: CustomButtonStyles.outlineBlackTL8,
        buttonTextStyle: CustomTextStyles.bodyMedium14);
  }

  /// Section Widget
  Widget _buildFiftySix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32.h, right: 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildMarket(context),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.only(left: 25.h),
            color: appTheme.whiteA700,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: appTheme.black900, width: 1.h),
                borderRadius: BorderRadiusStyle.roundedBorder7),
            child: Container(
              height: 36.v,
              width: 99.h,
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 29.h, top: 5.v),
                      child:
                          Text("Limit", style: CustomTextStyles.bodyMedium14),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28.h, vertical: 4.v),
                          decoration: AppDecoration.outlineBlack900.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder7),
                          child: Column(
                              //    mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 7.v),
                                Text("Limit",
                                    style: CustomTextStyles.bodyMedium14)
                              ])))
                ],
              ),
            ),
          ),
          _buildStopLoss(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTriggerPrice(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h),
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: triggerController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: '195.5',
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMargin(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.v),
        decoration: AppDecoration.fillBlueGray,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Margin",
                //    style: CustomTextStyles.bodyMediumManropeBluegray700
                style: TextStyle(color: AppColors.greyShade9),
              ),
              Text(
                "₹11,500",
                //    style: CustomTextStyles.titleSmallOnErrorContainer,
                style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBoxView(width: 30),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Charges",
                  style: TextStyle(color: AppColors.greyShade9),
                ),
                Text(
                  "₹30.26",
                  //    style: CustomTextStyles.titleSmallOnErrorContainer
                  style: TextStyle(
                      fontSize: 15.h, fontWeight: FontWeight.w600),
                )
              ])
        ]));
  }

  /// Section Widget
  Widget _buildSwipeToBuy(BuildContext context) {
    return Container(
      height: 43.v,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(8)),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageConstant.imgArrowleft,
              width: 24,
              height: 24,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBoxView(width: 10),
            TextView(
              text: 'Swipe To Buy',
            textColor: Theme.of(context).colorScheme.secondary,
            //  textColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildSixtySeven(
    BuildContext context, {
    required String lowText,
    required String numberText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lowText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        SizedBox(height: 3.v),
        Text(
          numberText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        )
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }
}
