import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/account_screen/account_screen.dart';
import 'package:prayas_capital/presentation/home_screen/home_screen.dart';
import 'package:prayas_capital/presentation/more_screen/more_screen.dart';
import 'package:prayas_capital/presentation/orders_screen/orders_screen.dart';
import 'package:prayas_capital/presentation/position_screen/position_screen.dart';
import 'package:prayas_capital/presentation/selling_screen/selling_screen.dart';
import 'package:prayas_capital/widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

import '../../Controller/app_theme/ThemeModel.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeModel>(
        builder: (BuildContext context, value, Widget? child) {
          return value.widgetOptions.elementAt(value.selectedIndex);
        },
      ),
      bottomNavigationBar: Consumer<ThemeModel>(
        builder: (BuildContext context, value, Widget? child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: MyString.bottomNavigationBarMore,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: MyString.bottomNavigationBarOrder,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_rounded),
                label: MyString.bottomNavigationBarPaperTrading,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: MyString.bottomNavigationBarAccount,
              ),
            ],
            currentIndex: value.selectedIndex,
            selectedIconTheme: IconThemeData(size: 26.h),
            selectedItemColor: Theme.of(context).colorScheme.onSecondary,
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            unselectedIconTheme: IconThemeData(size: 26.h),
            selectedFontSize: 14.h,
            showUnselectedLabels: false,
            onTap: value.onItemTapped,
          );
        },
      ),
    );
    //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  }
}
