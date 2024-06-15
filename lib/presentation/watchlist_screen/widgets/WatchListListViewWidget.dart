
import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';

import '../../../widgets/TextView.dart';

class WatchListListViewWidget extends StatelessWidget {

  String titleName;
  String subTitleName;
  String price;
  String percentage;

  WatchListListViewWidget({
    required this.titleName ,
    required this.subTitleName,
    required this.price,
    required this.percentage,
  });

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
                TextView(text: subTitleName),
              ],
            ),
          Column(
              children: [
                TextView(text: price,textColor: AppColors.red),
                TextView(text: percentage),
              ],
            ),
        ],
      ),
    );
  }
}
