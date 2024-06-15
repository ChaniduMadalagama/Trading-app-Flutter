import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../core/utils/ColorFile.dart';
import '../../core/utils/StringFile.dart';
import '../../routes/app_routes.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';

AppBar CustomeAppBar({required String appBarTitle, context}) {
  return AppBar(
    automaticallyImplyLeading: false,

    actions: [
      SizedBoxView(width: 20),
      Padding(
        padding: EdgeInsets.only(top: 10.v),
        child: TextView(
            text: appBarTitle,
            fontWeight: FontWeight.w600,
            textSize: 25,
            textColor: AppColors.white),
      ),
      Spacer(),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.searchScreen);
        },
        child: Container(
            height: 20,
            width: 20,
            child: Icon(
              Icons.search_rounded,
              color: AppColors.white,
              size: 23.h,
            )),
      ),
     /* SizedBoxView(width: 10.v),
      IconButton(
        iconSize: 23.h,
        icon: Icon(
          Icons.add,
          color: AppColors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addOptionScreen);
        },
      ),*/
      SizedBoxView(width: 15.v),
      Container(
        alignment: Alignment.topCenter,
        width: 20,
        //  color: Colors.grey,
        margin: EdgeInsets.only(top: 8),
        child: PopupMenuButton(
          padding: EdgeInsets.only(left: 1, right: 20, bottom: 5.v),
          iconSize: 23.h,
          iconColor: AppColors.white,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextView(
                text: MyString.quickHelp,
              ),
            ),
            PopupMenuItem(
                child: TextView(
              text: MyString.join_Telegram_Channel,
            )),
            PopupMenuItem(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.optionChainScreen);
                },
                child: TextView(text: MyString.open_Option_Chain)),
          ],
        ),
      ),
      SizedBoxView(width: 20),
    ],
  );
}
