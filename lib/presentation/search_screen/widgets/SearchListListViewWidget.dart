
import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';

import '../../../widgets/TextView.dart';

class SearchListListViewWidget extends StatelessWidget {

  String titleName;

  SearchListListViewWidget({
    required this.titleName,
  });

  factory SearchListListViewWidget.fromJson(Map<String, dynamic> json) {
    return SearchListListViewWidget(
      titleName: json['titleName'],
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
            ],
          ),
          Column(
            children: [
            ],
          ),

        ],
      ),
    );
  }
}
