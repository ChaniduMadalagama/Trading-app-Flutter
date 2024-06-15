import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/model/ipo_data_model.dart';
import 'package:prayas_capital/model/login_model.dart';
import 'package:prayas_capital/model/niftybank_Model.dart';
import 'package:prayas_capital/model/profile_screen.dart';
import 'package:prayas_capital/presentation/account_screen/account_screen.dart';
import 'package:prayas_capital/presentation/home_screen/home_screen.dart';
import 'package:prayas_capital/presentation/orders_screen/orders_screen.dart';
import 'package:prayas_capital/presentation/position_screen/position_screen.dart';
import '../../SharedPreferences/SharedPreferences.dart';
import '../../core/utils/AppUrl.dart';
import '../../model/NiftyDataModel.dart';
import '../../model/Nifty_Expiry_DataModel.dart';
import '../../model/daywise_data_model.dart';

class ThemeModel with ChangeNotifier {
  /// ------------>>>> Bottom Navigation Bar <<<<------------------- ///

  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    OrdersScreen(),
    PositionScreen(),
    AccountScreen(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  ///-///////////////////////////////////////////////////////////////////////

  SharedPreference sharedPreference = SharedPreference();
  AppUrl appUrl = AppUrl();

  bool _checkThemeShared = true;

  bool get checkThemeShared => _checkThemeShared;

  setAppTheme(bool theme) {
    sharedPreference.setchackQcList(theme);

    _checkThemeShared = theme;
    print("Theme ---> $_checkThemeShared");
    notifyListeners();
  }

  checkTheme() async {
    _checkThemeShared = await sharedPreference.ischackQcList();

    // print("Theme is ${_checkThemeShared}");
  }

  /////////////////////////////////////////////////////////////////////////////////

  /// Nifty 50 Api

  String? _tkr;
  String? _td;
  double? _op;
  double? _hp;
  double? _lp;
  double? _cp;
  double? _lastCp;
  double? _lastDayCp;
  double? _percentage;
  int? _vol;
  int? _oi;
  bool? _eod;

  String? get tkr => _tkr;

  String? get td => _td;

  double? get op => _op;

  double? get hp => _hp;

  double? get lp => _lp;

  double? get cp => _cp;

  double? get lastCp => _lastCp;

  double? get lastDayCp => _lastDayCp;

  double? get percentage => _percentage;

  int? get vol => _vol;

  int? get oi => _oi;

  bool? get eod => _eod;

  List<NiftyDataModel> stockList = [];
  List<NiftyDataModel> nifty50ReverseList = [];

  dynamic _now_date;

  Future<List<NiftyDataModel>> fetchStockData() async {
    _now_date = DateFormat('yyyyMMdd').format(DateTime.now());
    // print("date >>> $_now_date");

    String url = AppUrl.niftyUrl + _now_date + AppUrl.apiToken;

    //   print("Url >> $url");

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      // print(jsonData);
      //   print('refresh');
      return jsonData.map((json) => NiftyDataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stock data');
    }
  }

  double findPercent({required double profite, required double lastDayValue}) {
    double aa = profite / lastDayValue;

    double percent = aa * 100;

    return percent;
  }

  Future<void> fetchData() async {
    try {
      stockList = await fetchStockData();
      nifty50ReverseList = await fetchStockData();
      nifty50ReverseList.removeLast();
      //  print("Nifty 50 Second Last ${nifty50ReverseList.last.cp}");
      double? lastDayPrice = nifty50ReverseList.last.cp;
      _cp = stockList.last.cp;
      _lp = stockList.last.lp;
      _hp = stockList.last.hp;
      _op = stockList.last.lp;
      _lastCp = nifty50ReverseList.last.cp;

      double basePrice = _cp! - lastDayPrice!;

      _lastDayCp = basePrice;

      //    print("basePrice ==> $basePrice");

      //    print("cp --> $_cp");
      _percentage = findPercent(profite: basePrice, lastDayValue: _lastCp!);
      //   print("nifty percent -> $_percentage");
      notifyListeners();
      getNiftyData();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  getNiftyData() {
    Future.delayed(Duration(milliseconds: 1000), () {
      //  fetchStockData();
      fetchData();
    });
  }

  ////////////////////////////////////////////////////////////////////

  /// ------> Nifty Bank

  /*getBankNiftyData(context) {

    print("Call Bank Nifty");
    NiftyBankController niftyBankController = NiftyBankController();
    niftyBankController.getBankNiftyData();

  }*/

  String? _tkrBank;
  String? _tdBank;
  double? _opBank;
  double? _hpBank;
  double? _lpBank;
  double? _cpBank;
  int? _volBank;
  int? _oiBank;
  bool? _eodBank;
  double? _lastBankCp;
  double? _lastDayBankCp;
  double? _percentageBank;

  String? get tkrBank => _tkrBank;

  String? get tdBank => _tdBank;

  double? get opBank => _opBank;

  double? get hpBank => _hpBank;

  double? get lpBank => _lpBank;

  double? get cpBank => _cpBank;

  int? get volBank => _volBank;

  int? get oiBank => _oiBank;

  bool? get eodBank => _eodBank;

  double? get lastBankCp => _lastBankCp;

  double? get lastDayBankCp => _lastDayBankCp;

  double? get percentageBank => _percentageBank;

  List<NiftyBankModel> niftyBankData = [];
  List<NiftyBankModel> niftyBankData1 = [];

  Future<List<NiftyBankModel>> fetchBankNiftyStockData() async {
    _now_date = DateFormat('yyyyMMdd').format(DateTime.now());
    // print("date >>> $_now_date");

    String url = AppUrl.niftyBank + _now_date + AppUrl.apiToken;

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      // print("Bank $jsonData");
      //  print('Bank refresh');
      return jsonData.map((json) => NiftyBankModel.fromJson(json)).toList();
    } else {
      throw Exception('Bank Failed to load stock data');
    }
  }

  double findBankNiftyPercent(
      {required double profite, required double lastDayValue}) {
    double aa = profite / lastDayValue;

    double percent = aa * 100;

    return percent;
  }

  Future<void> fetchBankData() async {
    try {
      niftyBankData = await fetchBankNiftyStockData();
      niftyBankData1 = await fetchBankNiftyStockData();
      niftyBankData1.removeLast();
      //    print("Bank Second Last ${niftyBankData1.last.cp}");
      double? lastDayPrice = niftyBankData1.last.cp;
      _cpBank = niftyBankData.last.cp;
      _lpBank = niftyBankData.last.lp;
      _hpBank = niftyBankData.last.hp;
      _opBank = niftyBankData.last.lp;

      _lastBankCp = niftyBankData1.last.cp;

      double basePrice = _cpBank! - lastDayPrice!;

      _lastDayBankCp = basePrice;

      //   print("Bank basePrice ==> $basePrice");

      //   print("Bank cp --> $_cpBank");
      //  print("Bank cp --> $cpBank");
      _percentageBank =
          findBankNiftyPercent(profite: basePrice, lastDayValue: _lastBankCp!);
      //    print("percent -> $_percentageBank");

      getBankNiftyData();
      notifyListeners();
    } catch (e) {
      print('Bank Error fetching data: $e');
    }
  }

  getBankNiftyData() {
    //  print("Bank Call Bank Nifty");
    Future.delayed(Duration(milliseconds: 1000), () {
      //fetchBankNiftyStockData();
      fetchBankData();
      notifyListeners();
    });
  }

  /// -->>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Fll Data Screen <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-- ///

  DateTime date = DateTime.now();

  dateDialogBox(context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (newDate == null) {
    } else {
      date = newDate;
    }

    notifyListeners();
    print("date >>>>>>>>>>>>>>>>>>>>>>>> $date");
  }

  int outStandingOl = 0;

  findtype(int index) {
    outStandingOl = index;
    notifyListeners();
  }

  /// >>>>>>>>>>>>>>>>>>>>>> Login Screen Api <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ///

  bool? userLogin_status;
  String? userLogin_ApiToken;
  String? userLogin_Message;
  int? userLogin_id;
  String? userLogin_role;
  String? userLogin_type;
  String? userLogin_name;
  String? userLogin_email;
  String? userLogin_phone;
  String? userLogin_image;
  String? userLogin_address;
  dynamic userLogin_emailVerifiedAt;
  int? userLogin_status1;

  loginUser({String? userEmail,String? name, String? id, String? token, context}) async {
    //try {
    var body = {
      "email" :  userEmail!,
      "name" :  name,
      "accessToken" : token!,
    };
    print("request" +body.toString());
      final response = await http.post(
        Uri.parse(AppUrl.loginUrl),
        headers: {"Accept": "application/json"},
        body: body
      );
      print("Login Api Response >>>>>> ${response.body}");
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        userLogin_status = loginModel.status;
        userLogin_ApiToken = loginModel.apiToken;
        userLogin_Message = loginModel.message;
        userLogin_id = loginModel.data!.id;
        userLogin_role = loginModel.data!.role;
        userLogin_type = loginModel.data!.type;
        userLogin_name = loginModel.data!.name;
        userLogin_email = loginModel.data!.email;
        userLogin_phone = loginModel.data!.phone;
        userLogin_image = loginModel.data!.image;
        userLogin_address = loginModel.data!.address;
        userLogin_emailVerifiedAt = loginModel.data!.emailVerifiedAt;
        userLogin_status1 = loginModel.data!.status;
        print("userLogin_ApiToken >>>>>>>>> $userLogin_ApiToken");
        sharedPreference.settoken(userLogin_ApiToken!);
        sharedPreference.setLoggedIn(true);
        print("userLogin_email >>>>>>>>> $userLogin_email");
        print("userLogin_name >>>>>>>>> $userLogin_name");
        print("Login Api Response >>>>>> ${response.statusCode}");
        Navigator.pushReplacementNamed(
            context, AppRoutes.bottomNavigationBarScreenRoutesaaaaaaaa);
      } else {
        print("Login Api Response >>>>>> ${response.statusCode}");
        print('Somthing Wont >>>>>>>>>>>>>>>');
      }
    /*} catch (e) {
      print("Error >>>>>>>>>>>>>>> $e");
    }*/
  }

  /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Profile Screen <<<<<<<<<<<<<<<<<<<<<<<< ////

  bool? profile_status;
  String? profile_message;
  int? profile_id;
  String? profile_role;
  String? profile_type;
  String? profile_name;
  String? profile_email;
  String? profile_phone;
  String? profile_image;
  String? profile_address;
  dynamic profile_emailVerifiedAt;
  int? profile_status1;

  getUserProfileData() async {
    String token = await sharedPreference.istoken();
    print(token);
    try {
      final response = await http.get(
        Uri.parse(AppUrl.get_user_profile_data),
        headers: {
          "Accept": "application/json",
          //   "Authorization" : "Bearer 2|pqhTLzqIZGgVkZ1kXLqXVnKW5pNFumGzCwe0sp5Xe7c701fd"
          "Authorization": "Bearer $token"
        },
      );
      print("Profile Api Response >>>>>> ${response.statusCode}");
      print("Profile Api Response >>>>>> ${token}");
      ProfileScreen profileScreen =
          ProfileScreen.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        profile_status = profileScreen.status;
        profile_message = profileScreen.message;
        profile_id = profileScreen.data!.id;
        profile_role = profileScreen.data!.role;
        profile_type = profileScreen.data!.type;
        profile_name = profileScreen.data!.name;
        profile_email = profileScreen.data!.email;
        profile_phone = profileScreen.data!.phone;
        profile_image = profileScreen.data!.image;
        profile_address = profileScreen.data!.address;
        profile_emailVerifiedAt = profileScreen.data!.emailVerifiedAt;
        profile_status1 = profileScreen.data!.status;

        notifyListeners();

        print("Profile Api Response >>>>>> ${response.statusCode}");
        print("Profile Api Response >>>>>> ${profile_name}");
      } else {
        print("Profile Api Response >>>>>> ${response.statusCode}");
        print('Somthing Wont >>>>>>>>>>>>>>>');
      }
    } catch (e) {
      print("Profile Api Error >>>>>>>>>>>>>>> $e");
    }
  }

  /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> get Ipo Api <<<<<<<<<<<<<<<<<<<<<<<< ////

  List<IpoDataModelData>? ipoListData = [];
  bool? ipo_status;
  String? ipo_message;

  getIpoDetails() async {
    String token = await sharedPreference.istoken();
    print(token);
    try {
      final response = await http.post(
        Uri.parse(AppUrl.get_ipo),
        headers: {
          "Accept": "application/json",
          //"Authorization": "Bearer 34|FdhqDKejK12PSziDjxQdf1bujnz5IFtsfizUgwxp0a605d69"
          "Authorization": "Bearer $token"
        },
      );
      print(">>>>>>>>>>>>>>>>>>>>>Response Code of Ipo ${response.statusCode}");
      IpoDataModel ipoData = IpoDataModel.fromJson(jsonDecode(response.body));
      print(response.body);

      if (response.statusCode == 200) {
        ipoListData = ipoData.data;
        ipo_status = ipoData.status;
        ipo_message = ipoData.message;

        notifyListeners();
      } else {
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of Ipo ${response.statusCode}");
      }
    } catch (e) {
      print("E >>>> $e");
    }
  }

  /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> get Nifty Expiry Api <<<<<<<<<<<<<<<<<<<<<<<< ////
  String indexLabel = 'NIFTY';
  String? expiryLabel;
  String optionTypeLabel = 'CE';
  String stokePriceLabel = 'stokePrice 1';

  List<NiftyExpriyData>? niftyExpiryDataList = [];
  bool? nifty_expiry_status;
  String? nifty_expiry_message;

  getNiftyExpiryDetails({required String optionType}) async {
    String token = await sharedPreference.istoken();
    print(token);
    try {
      final response =
          await http.post(Uri.parse(AppUrl.get_nifty_expiry_data), headers: {
        "Accept": "application/json",
        // "Authorization": "Bearer 34|FdhqDKejK12PSziDjxQdf1bujnz5IFtsfizUgwxp0a605d69"
        "Authorization": "Bearer $token"
      }, body: {
        "type": "$optionType"
      });

      NiftyExpriyDataModel niftyExpriyDataModel =
          NiftyExpriyDataModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of NiftyExpiry ${response.statusCode}");

        niftyExpiryDataList = niftyExpriyDataModel.data;
        nifty_expiry_status = niftyExpriyDataModel.status;
        nifty_expiry_message = niftyExpriyDataModel.message;
        expiryLabel = niftyExpiryDataList![0].endDate;
        notifyListeners();
      } else {
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of NiftyExpiry ${response.statusCode}");
      }
    } catch (e) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>${e.toString()}");
    }
  }

  getExpiryDateInDropdown({required String date}) {
    expiryLabel = date;
    print("expiryLabel >>>>>> $expiryLabel");
    notifyListeners();
  }

  /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Daywise Data Api <<<<<<<<<<<<<<<<<<<<<<<< ////

  List<DaywiseData>? daywisedata;
  bool? daywise_status;
  String? daywise_message;

  getDaywiseData() async {
    String token = await sharedPreference.istoken();
    print(token);
    try {
      final response = await http.post(
        Uri.parse(AppUrl.get_daywise_data),
        headers: {
          "Accept": "application/json",
          // "Authorization": "Bearer 34|FdhqDKejK12PSziDjxQdf1bujnz5IFtsfizUgwxp0a605d69"
          "Authorization": "Bearer $token"
        },
      );
      DaywiseDataModel daywiseDataModel =
          DaywiseDataModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of DayWiseData ${response.statusCode}");
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of DayWiseData ${response.body}");

        daywisedata = daywiseDataModel.data;
        daywise_status = daywiseDataModel.status;
        daywise_message = daywiseDataModel.message;
        notifyListeners();
      } else {
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of DayWiseData ${response.statusCode}");
        print(
            ">>>>>>>>>>>>>>>>>>>>>Response Code of DayWiseData ${response.body}");
      }
    } catch (e) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>${e.toString()}");
    }
  }
}
