import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import '../../../core/utils/StringFile.dart';
import '../../buy_screen/buy_screen.dart';

class PositionScreenListViewWidget extends StatelessWidget {
  String titleName;
  String subTitleName;
  String date;
  String price;
  String lpt;
  int qty;
  String ipoOpenClose;

  PositionScreenListViewWidget({
    required this.titleName,
    required this.subTitleName,
    required this.date,
    required this.price,
    required this.lpt,
    required this.qty,
    required this.ipoOpenClose,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*      Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                child: BuyScreen()));*/
        Navigator.pushNamed(context, AppRoutes.placeOrderScreen);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 2, bottom: 2),
                      width: MediaQuery.of(context).size.width / 4.2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black26),
                        borderRadius: BorderRadius.circular(30),
                        //    color: AppColors.white
                        // border: Border.all(color: AppColors.white),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text(
                        "${qty} ${MyString.qty}",
                        style: TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Avg. 100.78',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(titleName),
                Text(subTitleName),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                  width: MediaQuery.of(context).size.width / 4.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black26),
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text(
                    ipoOpenClose,
                    style: TextStyle(
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                  width: MediaQuery.of(context).size.width / 4.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black26),
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${MyString.ltp}',
                        style: TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                      Text(
                        ' $lpt',
                        style: TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
