import 'package:flutter/material.dart';
import 'package:prayas_capital/core/utils/size_utils.dart';
import 'package:prayas_capital/widgets/TextView.dart';

class IpoListViewWidget extends StatelessWidget {
  String Name;
  String subTitleName;
  String price;
  String date;

  IpoListViewWidget({
    required this.Name,
    required this.subTitleName,
    required this.price,
    required this.date,
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
              Container(
                  margin: EdgeInsets.only(left: 8),
                  child: TextView(text: Name)),
              TextView(text: price),
            ],
          ),
          Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3.5,
                  //height: 10,
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Theme.of(context).colorScheme.onSecondary)),
                  child: TextView(text: subTitleName, /*textColor: AppColors.black*/)),
              SizedBox(height: 1.h,),
              TextView(text: date),
            ],
          ),
        ],
      ),
    );
  }
}
