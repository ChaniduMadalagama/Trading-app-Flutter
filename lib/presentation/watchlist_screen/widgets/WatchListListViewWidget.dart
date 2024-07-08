
import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';

import '../../../widgets/TextView.dart';

class WatchListListViewWidget extends StatelessWidget {

  String titleName;
  String subTitleName;
  String price;
  String percentage;
  String high;
  String low;
  String exchange;
  String lastTradeTime;

  WatchListListViewWidget({
    required this.titleName,
    required this.subTitleName,
    required this.price,
    required this.percentage,
    required this.high,
    required this.low,
    required this.exchange,
    required this.lastTradeTime,
  });

  factory WatchListListViewWidget.fromJson(Map<String, dynamic> json) {
    return WatchListListViewWidget(
        titleName: json['titleName'],
        subTitleName: json['subTitleName'],
        price: json['price'],
        percentage: json['percentage'],
        high: json['high'],
        low: json['low'],
        exchange: json['exchange'],
        lastTradeTime: json['lastTradeTime'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(text: titleName),
                TextView(text: exchange),
              ],
            ),
          Column(
              children: [
                TextView(text: exchange,textColor: AppColors.red),
                TextView(text: percentage),
              ],
            ),

        ],
      ),
    );
  }
}
