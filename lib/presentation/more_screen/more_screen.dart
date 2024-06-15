import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/TextView.dart';

class MoreScreen extends StatelessWidget {
   MoreScreen({Key? key})
      : super(
    key: key,
  );
  List<servicesModel> servicesList = [
    servicesModel(appRoutes: AppRoutes.optionChainScreen,
        name: MyString.option_Chain,
        icon: ImageConstant.imgSupplyChainTr),
    servicesModel(appRoutes: AppRoutes.fiiDataScreen,
        name: MyString.fii_dii_data,
        icon: ImageConstant.fiiDiiIcon),
    servicesModel(appRoutes: AppRoutes.basketOrdersOneScreen,
        name: MyString.Baskets,
        icon: ImageConstant.basketIcon),

    servicesModel(appRoutes: AppRoutes.monthSummaryScreen,
        name: MyString.month_summary,
        icon: ImageConstant.monthSummrayIcon),

    servicesModel(appRoutes: AppRoutes.profitAndLossOneScreen,
        name: MyString.profit_Loss,
        icon: ImageConstant.profitLossIcon),

    servicesModel(appRoutes: AppRoutes.tradesAndChargesScreen,
        name: MyString.trades_And_Charges,
        icon: ImageConstant.tradesChargesIcon),

    servicesModel(appRoutes: AppRoutes.upcomingIpoScreen,
        name: MyString.Upcoming_IPO,
        icon: ImageConstant.upcomingIpoIcon),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        // appBar: _buildAppBar(context),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          //   backgroundColor: AppColors.appColor,
          title: TextView(
              text: 'Services', textSize: 20.h, textColor: AppColors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 6.v),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.v),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 5.h,bottom: 5.h),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, servicesList[index].appRoutes.toString());
                        },
                        child: servicesRow(
                            img: servicesList[index].icon.toString(),
                            serviceName: servicesList[index].name.toString(),
                            context: context,)),
                  );
                },),
                SizedBox(height: 10.v),
                Divider(
                  color: appTheme.gray200,
                  indent: 18.h,
                  endIndent: 18.h,
                ),
                SizedBox(height: 23.v),
                //Spacer(),
                Text(
                  MyString.join_our_community,
                  // style: CustomTextStyles.titleMediumOnErrorContainer,
                  style: TextStyle(fontSize: 17.h),
                ),
                SizedBox(height: 6.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img1658587303instagramPng,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(
                        top: 5.v,
                        bottom: 4.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgLogoTwitterPng5859,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(
                        left: 15.h,
                        top: 2.v,
                        bottom: 1.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgTelegramLogoT,
                      height: 27.v,
                      width: 30.h,
                      margin: EdgeInsets.only(left: 10.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgIcons8Facebook48,
                      height: 20.v,
                      width: 21.h,
                      margin: EdgeInsets.only(
                        left: 15.h,
                        top: 4.v,
                        bottom: 3.v,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.v),
                ///

              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNiftyRow(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.optionChainScreen);
        },
        child: Container(
          height: 60.h,
          alignment: Alignment.center,
          width: MediaQuery
              .of(context)
              .size
              .width,
          // margin: EdgeInsets.symmetric(horizontal: 7.h),
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 5.v,
          ),
          decoration: BoxDecoration(
            //color: AppColors.white,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                ImageConstant.imgSupplyChainTrSvg,
                height: 33.adaptSize,
                width: 33.adaptSize,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onSecondary,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  top: 9.v,
                  bottom: 11.v,
                ),
                child: Text(
                  MyString.option_Chain,
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSecondary,
                      fontSize: 17.h),
                  //CustomTextStyles.bodyMedium14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFiiDiiDataRow(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 10,
      child: Container(
        height: 60.h,
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        // margin: EdgeInsets.symmetric(horizontal: 7.h),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 5.v,
        ),
        decoration: BoxDecoration(
          //color: AppColors.white,
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomImageView(
              imagePath: ImageConstant.fiiDiiIcon,
              height: 33.v,
              width: 33.h,
            ),
/*
            SvgPicture.asset(
              ImageConstant.fiiDiiIcon,
              height: 33.adaptSize,
              width: 33.adaptSize,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
*/
            Padding(
              padding: EdgeInsets.only(
                left: 15.h,
                top: 9.v,
                bottom: 8.v,
              ),
              child: Text(
                MyString.fii_dii_data,
                //style: CustomTextStyles.bodyMedium14,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
                    fontSize: 17.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBasketsRow(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 10,
      child: Container(
        height: 60.h,
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        // margin: EdgeInsets.symmetric(horizontal: 7.h),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 5.v,
        ),
        decoration: BoxDecoration(
          //color: AppColors.white,
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomImageView(
              // imagePath: ImageConstant.img75753493PngF,
              imagePath: ImageConstant.basketIcon,
              height: 33.v,
              width: 33.h,
            ),
/*
            SvgPicture.asset(
              ImageConstant.basketIcon,
              height: 28.adaptSize,
              width: 26.adaptSize,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
*/
            Padding(
              padding: EdgeInsets.only(
                left: 18.h,
                top: 8.v,
                bottom: 6.v,
              ),
              child: Text(
                MyString.Baskets,
                //   style: CustomTextStyles.bodyMedium14,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
                    fontSize: 17.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfitLossRow(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 10,
      child: Container(
        height: 60.h,
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        // margin: EdgeInsets.symmetric(horizontal: 7.h),
        padding: EdgeInsets.symmetric(
          horizontal: 4.h,
          vertical: 5.v,
        ),
        decoration: BoxDecoration(
          //color: AppColors.white,
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomImageView(
              imagePath: ImageConstant.profitLossIcon,
              height: 33.adaptSize,
              width: 33.adaptSize,
              margin: EdgeInsets.only(bottom: 1.v, top: 4.v),
            ),
/*
            SvgPicture.asset(
              ImageConstant.profitLossIcon,
              height: 45.adaptSize,
              width: 45.adaptSize,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
*/
            Padding(
              padding: EdgeInsets.only(
                top: 13.v,
                bottom: 17.v,
                left: 5.v,
              ),
              child: Text(
                MyString.profit_Loss,
                //style: CustomTextStyles.bodyMedium14,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
                    fontSize: 17.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUpcomingIpoRow(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 10,
      child: Container(
        height: 60.h,
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        // margin: EdgeInsets.symmetric(horizontal: 7.h),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 5.v,
        ),
        decoration: BoxDecoration(
          //color: AppColors.white,
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomImageView(
              imagePath: ImageConstant.upcomingIpoIcon,
              height: 33.adaptSize,
              width: 33.adaptSize,
              margin: EdgeInsets.only(bottom: 1.v, top: 4.v),
            ),
/*
            SvgPicture.asset(
              ImageConstant.upcomingIpoIcon,
              height: 28.adaptSize,
              width: 26.adaptSize,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
*/
            Padding(
              padding: EdgeInsets.only(
                left: 18.h,
                top: 9.v,
                bottom: 5.v,
              ),
              child: Text(
                MyString.Upcoming_IPO,
                // style: CustomTextStyles.bodyMedium14,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
                    fontSize: 17.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildTradesChargesRow(BuildContext context, {
    required String tradesAndChargesText,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 10,
      child: Container(
        // width: MediaQuery.of(context).size.width / 1.1,
        height: 60.h,
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        // margin: EdgeInsets.symmetric(horizontal: 7.h),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 5.v,
        ),
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomImageView(
              imagePath: ImageConstant.tradesChargesIcon,
              height: 33.adaptSize,
              width: 33.adaptSize,
              margin: EdgeInsets.only(bottom: 1.v, top: 4.v),
            ),

/*
            SvgPicture.asset(
              ImageConstant.tradesChargesIcon,
              height: 26.adaptSize,
              width: 26.adaptSize,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
*/
            Padding(
              padding: EdgeInsets.only(
                left: 18.h,
                top: 8.v,
                bottom: 6.v,
              ),
              child: Text(
                tradesAndChargesText,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
                    fontSize: 17.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget servicesRow({
    required String img,
    required String serviceName,
    required BuildContext context}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),

      ),
      elevation: 10,
      child: Container(
        // width: MediaQuery.of(context).size.width / 1.1,
        height: 60.h,
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        // margin: EdgeInsets.symmetric(horizontal: 7.h),
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 5.v,
        ),
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomImageView(
              imagePath: img,
              height: 28.adaptSize,
              width: 28.adaptSize,
              margin: EdgeInsets.only(bottom: 1.v, top: 4.v),
            ),

            /*
            SvgPicture.asset(
              ImageConstant.tradesChargesIcon,
              height: 26.adaptSize,
              width: 26.adaptSize,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      */
            Padding(
              padding: EdgeInsets.only(
                left: 18.h,
                top: 8.v,
                bottom: 6.v,
              ),
              child: Text(
                serviceName,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
                    fontSize: 17.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class servicesModel {
  String? appRoutes;
  String? icon;
  String? name;

  servicesModel(
      {required this.appRoutes, required this.name, required this.icon});
}
