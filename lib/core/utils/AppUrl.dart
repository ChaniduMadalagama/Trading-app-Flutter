import 'package:intl/intl.dart';

class AppUrl
{



 static String baseUrl = "https://apidata.accelpix.in/api/fda/rest/";
 static String apiToken = "?api_token=eAZf1NVXI40AiRdbj%2BubErs6Hbk%3D";


  static String niftyUrl = baseUrl+"NIFTY%2050/20240201/";

  static String niftyBank = baseUrl+"NIFTY%20Bank/20240201/";

  /// >>>> Web View Url

  static const String bankNifty = "https://in.tradingview.com/chart/?symbol=NSE%3ABANKNIFTY";
  static const String nifty50 = "https://in.tradingview.com/chart/?symbol=NSE%3ANIFTY";

  /// >>>>> Login Api

 static const String apiBaseUrl = "https://www.prayascapital.com/api/";

 static const String loginUrl = apiBaseUrl+"login";
 // static const String get_user_profile_data = apiBaseUrl+"get_user";
 static const String get_user_profile_data = apiBaseUrl+"profile";

 static const String get_ipo = apiBaseUrl+"get_ipo";

 static const String get_nifty_expiry_data = apiBaseUrl+"get_nifty_dates";


 static const String get_daywise_data = apiBaseUrl+"get_stocks";


}