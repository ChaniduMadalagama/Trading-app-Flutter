import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/selling_screen/selling_screen.dart';
import 'package:prayas_capital/presentation/watchlist_screen/watchlist_screen.dart';

import '../../../core/utils/StringFile.dart';

class TabBarWidget extends StatefulWidget {
  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          //  backgroundColor: Colors.yellow,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              height: 38.h,
              //   color: Colors.grey,
              child: TabBar(
                indicatorWeight: 0.1,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                isScrollable: false,
                //indicatorPadding: EdgeInsets.only(left: 40, right: 40, top: 4, bottom: 4),
                indicator: BoxDecoration(
                  //  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.appColor,
                ),
                tabs: [
                  Tab(
                      icon: Container(
                          child: Text(
                    MyString.watchlist,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ))),
                  Tab(
                      icon: Container(
                          child: Text(
                    MyString.position,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ))),
                  Tab(
                      icon: Container(
                          child: Text(
                    MyString.orders,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ))),
                ],
              ),
            ),
          ), // AppBar
          body: TabBarView(
            children: [
              WatchlistScreen(),
              SellingScreen(),
              //OrdersScreen()
              Icon(
                Icons.shopping_cart_sharp,
                size: 50,
              )
            ],
          ), //
        ));
  }
}
