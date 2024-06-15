import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Account",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.accountScreen),
                        ),
                        /*_buildScreenTitle(
                          context,
                          screenTitle: "Home",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.BottomNavigationBarScreen),
                        ),*/
                        _buildScreenTitle(
                          context,
                          screenTitle: "Startup screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startupScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.startScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Walkthrough FortyOne",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.walkthroughFortyoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "buy",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.buyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Position",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.positionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "orders",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.ordersScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "More Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.moreScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Contact Us",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactUsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Basket orders",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.basketOrdersScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Basket orders One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.basketOrdersOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Selling",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sellingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profit And loss One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profitAndLossOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Trades And Charges",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.tradesAndChargesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Fii Data",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.fiiDataScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Watchlist",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.watchlistScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Phone Verification",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.phoneVerificationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Success Message",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successMessageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Create Account",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.createAccountScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
