import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:prayas_capital/core/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';

class MyChartPage extends StatefulWidget {
  String? type;

  MyChartPage({required this.type});

  @override
  _MyChartPageState createState() => _MyChartPageState();
}

class _MyChartPageState extends State<MyChartPage> {
  String? url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    url = widget.type == "BankNifty" ? AppUrl.bankNifty : AppUrl.nifty50;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyString.trading_View,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(url!),
          ),
        ),
      ),
    );
  }
}
