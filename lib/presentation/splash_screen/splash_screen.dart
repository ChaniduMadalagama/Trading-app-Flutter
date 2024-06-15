import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/image_constant.dart';

import '../../SharedPreferences/SharedPreferences.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreference sharedPreference = SharedPreference();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1500), () async {
      bool login = await sharedPreference.isLoggedIn();
      if (login == true) {
        Navigator.pushReplacementNamed(
            context, AppRoutes.bottomNavigationBarScreenRoutesaaaaaaaa);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.startScreen);
      }
    });

/*
    Future.delayed(Duration(milliseconds: 1500),(){
      Navigator.pushNamed(context, AppRoutes.startScreen);
    });
*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageConstant.appLogo,
              height: 170.h,
              width: 170.h,
            ),
          ),
          Text(
            "Prayas Capital",
            /*style: CustomTextStyles.titleLargeManropeOnErrorContainer,*/ style:
                TextStyle(fontSize: 20.h, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
