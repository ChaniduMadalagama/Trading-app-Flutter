import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/AppUrl.dart';
import 'package:prayas_capital/model/niftybank_Model.dart';

class NiftyBankController with ChangeNotifier {
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

  Future<List<NiftyBankModel>> fetchBankNiftyStockData() async {
    final response = await http.get(Uri.parse(AppUrl.niftyBank));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print("Bank $jsonData");
      print('Bank refresh');
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
      print("Bank Second Last ${niftyBankData[5].cp}");
      double? lastDayPrice = niftyBankData[5].cp;
      _cpBank = niftyBankData.last.cp;
      _lpBank = niftyBankData.last.lp;
      _hpBank = niftyBankData.last.hp;
      _opBank = niftyBankData.last.lp;
      _lastBankCp = niftyBankData[5].cp;

      double basePrice = _cpBank! - lastDayPrice!;

      _lastDayBankCp = basePrice;

      print("Bank basePrice ==> $basePrice");

      print("Bank cp --> $_cpBank");
      print("Bank cp --> $cpBank");
      _percentageBank =
          findBankNiftyPercent(profite: basePrice, lastDayValue: _lastBankCp!);
      print("percent -> $_percentageBank");

      getBankNiftyData();
      notifyListeners();
    } catch (e) {
      print('Bank Error fetching data: $e');
    }
  }

  getBankNiftyData() {
    print("Bank Call Bank Nifty");
    Future.delayed(
      Duration(seconds: 1),
      () {
        fetchBankNiftyStockData();
        fetchBankData();
        notifyListeners();
      },
    );
  }
}
