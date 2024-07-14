import 'package:flutter/material.dart';
import 'package:prayas_capital/presentation/BottomNavigationBarScreen/BottomNavigationBarScreen.dart';
import 'package:prayas_capital/presentation/account_screen/account_screen.dart';
import 'package:prayas_capital/presentation/fii_data_screen/dayWish_data_widget.dart';
import 'package:prayas_capital/presentation/option_chain_screen/option_chain_screen.dart';
import 'package:prayas_capital/presentation/startup_screen/startup_screen.dart';
import 'package:prayas_capital/presentation/start_screen/start_screen.dart';
import 'package:prayas_capital/presentation/upcoming_ipo_screen/upcoming_ipo_screen.dart';
import 'package:prayas_capital/presentation/walkthrough_fortyone_screen/walkthrough_fortyone_screen.dart';
import 'package:prayas_capital/presentation/home_screen/home_screen.dart';
import 'package:prayas_capital/presentation/buy_screen/buy_screen.dart';
import 'package:prayas_capital/presentation/position_screen/position_screen.dart';
import 'package:prayas_capital/presentation/orders_screen/orders_screen.dart';
import 'package:prayas_capital/presentation/more_screen/more_screen.dart';
import 'package:prayas_capital/presentation/contact_us_screen/contact_us_screen.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/basket_orders_screen.dart';
import 'package:prayas_capital/presentation/selling_screen/selling_screen.dart';
import 'package:prayas_capital/presentation/profit_and_loss_one_screen/profit_and_loss_one_screen.dart';
import 'package:prayas_capital/presentation/trades_and_charges_screen/trades_and_charges_screen.dart';
import 'package:prayas_capital/presentation/fii_data_screen/fii_data_screen.dart';
import 'package:prayas_capital/presentation/search_screen/search_screen.dart';
import 'package:prayas_capital/presentation/watchlist_screen/watchlist_screen.dart';
import 'package:prayas_capital/presentation/phone_verification_screen/phone_verification_screen.dart';
import 'package:prayas_capital/presentation/success_message_screen/success_message_screen.dart';
import 'package:prayas_capital/presentation/create_account_screen/create_account_screen.dart';
import 'package:prayas_capital/presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/add_option_screen/add_option_screen.dart';
import '../presentation/basket_orders_screen/basket_orders_one_screen.dart';
import '../presentation/fii_data_screen/oi_vs_time_chart_screen.dart';
import '../presentation/month_summary_screen/month_summary_screen.dart';
import '../presentation/orders_screen/place_order_screen.dart';
import '../presentation/position_screen/view_order_screen.dart';
import '../presentation/position_screen/position_history.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/theme_change/chenge_theme.dart';

class AppRoutes {
  static const String accountScreen = '/account_screen';

  static const String bottomNavigationBarScreenRoutesaaaaaaaa =
      '/BottomNavigationBarScreen';

  static const String startupScreen = '/startup_screen';

  static const String startScreen = '/start_screen';

  static const String walkthroughFortyoneScreen =
      '/walkthrough_fortyone_screen';

  static const String homeScreen = '/home_screen';

  static const String buyScreen = '/buy_screen';

  static const String positionScreen = '/position_screen';

  static const String ordersScreen = '/orders_screen';

  static const String moreScreen = '/more_screen';

  static const String contactUsScreen = '/contact_us_screen';

  static const String basketOrdersScreen = '/basket_orders_screen';

  //static const String basketOrdersOneScreen = '/basket_orders_one_screen';
  static const String basketOrdersOneScreen = '/basket_orders_one_screen';

  static const String sellingScreen = '/selling_screen';

  static const String profitAndLossOneScreen = '/profit_and_loss_one_screen';

  static const String tradesAndChargesScreen = '/trades_and_charges_screen';

  static const String fiiDataScreen = '/fii_data_screen';

  static const String searchScreen = '/search_screen';

  static const String watchlistScreen = '/watchlist_screen';

  static const String phoneVerificationScreen = '/phone_verification_screen';

  static const String successMessageScreen = '/success_message_screen';

  static const String createAccountScreen = '/create_account_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String upcomingIpoScreen = '/upcoming_ipo_screen';

  static const String splashScreen = '/splash_screen';

  static const String changeThemeScreen = '/chenge_theme';

  static const String addOptionScreen = '/add_option_screen';

  static const String optionChainScreen = '/option_chain_screen';

  static const String oiVsTimeChartScreen =
      'fii_data_screen/oi_vs_time_chart_screen';

  static const String monthSummaryScreen = '/month_summary_screen';

  static const String positionHistory = '/position_history';
  static const String placeOrderScreen = '/place_order_screen';
  static const String viewPositionScreen = '/view_position_screen';
  static const String dayWishDataWidget = '/dayWish_data_widget';

  static Map<String, WidgetBuilder> routes = {
    accountScreen: (context) => AccountScreen(),
    startupScreen: (context) => StartupScreen(),
    startScreen: (context) => StartScreen(),
    walkthroughFortyoneScreen: (context) => WalkthroughFortyoneScreen(),
    homeScreen: (context) => HomeScreen(),
    buyScreen: (context) => BuyScreen(),
    positionScreen: (context) => PositionScreen(),
    ordersScreen: (context) => OrdersScreen(),
    moreScreen: (context) => MoreScreen(),
    contactUsScreen: (context) => ContactUsScreen(),
    basketOrdersScreen: (context) => BasketOrdersScreen(),
    // basketOrdersOneScreen: (context) => BasketOrdersOneScreen(),
    basketOrdersOneScreen: (context) => BasketOrdersOneScreen(),
    sellingScreen: (context) => SellingScreen(),
    profitAndLossOneScreen: (context) => ProfitAndLossOneScreen(),
    tradesAndChargesScreen: (context) => TradesAndChargesScreen(),
    fiiDataScreen: (context) => FiiDataScreen(),
    searchScreen: (context) => SearchScreen(),
    watchlistScreen: (context) => WatchlistScreen(),
    phoneVerificationScreen: (context) => PhoneVerificationScreen(),
    successMessageScreen: (context) => SuccessMessageScreen(),
    createAccountScreen: (context) => CreateAccountScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    bottomNavigationBarScreenRoutesaaaaaaaa: (context) =>
        BottomNavigationBarScreen(),
    upcomingIpoScreen: (context) => UpcomingIpoScreen(),
    splashScreen: (context) => SplashScreen(),
    changeThemeScreen: (context) => ChangeTheme(),
    addOptionScreen: (context) => AddOptionScreen(),
    optionChainScreen: (context) => OptionChainScreen(),
    oiVsTimeChartScreen: (context) => OiVsTimeChartScreen(),
    monthSummaryScreen: (context) => MonthSummaryScreen(),
    positionHistory: (context) => PositionHistory(),
    placeOrderScreen: (context) => PlaceOrderScreen(
      titleName: '',
      subTitleName: '',
      high: '',
      low: '',
      percentage: '',
      price: '',
      exchange: '',
      lastTradeTime: '',
    ),
    // viewPositionScreen: (context) => ViewPositionScreen(),
    dayWishDataWidget: (context) => DayWishDataWidget(),
  };
}
