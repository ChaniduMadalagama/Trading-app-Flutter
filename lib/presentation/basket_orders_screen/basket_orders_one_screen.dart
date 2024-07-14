import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/Widget/tabBar.dart';
import '../../widgets/App.dart';
import '../../widgets/ButtonView.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:prayas_capital/auth/UserProvider.dart';

class BasketOrdersOneScreen extends StatefulWidget {
  BasketOrdersOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<BasketOrdersOneScreen> createState() => _BasketOrdersOneScreenState();
}

class _BasketOrdersOneScreenState extends State<BasketOrdersOneScreen> with SingleTickerProviderStateMixin{

  TextEditingController basketNameController = TextEditingController();
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void handleSubmit(BuildContext context) async{
    print('asasdsa');
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userId = userProvider.user?.user_id;

    String name = basketNameController.text;
    final response = await http.post(
      Uri.parse('http://prayascapital.com:5000/baskets/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': userId,
        'name': name
      }),
    );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: _buildAppBar(context),
        appBar: AppBar(
          shadowColor: AppColors.black,
          elevation: 10,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          //  backgroundColor: AppColors.appColor,
          title: Text(
            "Basket Orders",
            style: TextStyle(
                fontSize: 21.h,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children:[
                Container(
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ButtonView(
                      borderColor: AppColors.white,
                    bottomMargin: 10,
                    buttonWidth: MediaQuery.of(context).size.width / 1.1,
                    buttonHeight: 42.v,
                    buttonName: 'Create New Basket',
                    textSize: 15.h,
                    textColor: Theme.of(context).colorScheme.onBackground,
                    buttonColor: AppColors.appColor,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: SingleChildScrollView(
                              child: Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                surfaceTintColor: AppColors.white,
                                child: Container(
                                  height: 220,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Create New Basket",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        CustomTextFormField(
                                          autofocus: false,
                                          controller:basketNameController ,
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          prefix: Icon(Icons.shopping_basket_rounded,color: AppColors.UsernameColor,),
                                          hintText: "Enter Basket Name",
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                        CustomOutlinedButton(
                                          buttonStyle:
                                          CustomButtonStyles.outlineBlackTL8.copyWith(
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            )),
                                          ),
                                          text: "Create",
                                          height: 45,
                                          onPressed: () {
                                            handleSubmit(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      // Navigator.pushNamed(context, AppRoutes.basketOrdersScreen);
                    },
                    borderRadiuss: 5,),
                  ),
                ),
          ],
            ),
            Expanded(child: TabBarWidgwtBasketScreen()),

        /*              Padding(
              padding: EdgeInsets.only(
                left: 19.h,
                right: 5.h,
              ),
              child:
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    ImageConstant.imgPngBasketSvg,
                    height: 25.v,
                    width: 25.h,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  SizedBoxView(width: 10.h),
                  Text(
                    "Swing trading",
                    *//*  style: theme.textTheme.titleSmall!.copyWith(
                      color: appTheme.gray800,
                    ),*//*
                    style: TextStyle(
                        fontSize: 16.h, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder13,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    child: Text(
                      "Created",
                      style: CustomTextStyles.titleSmallPrimary.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 34.h),
                child: Text(
                  "0 Items",
                  // style: TextStyle(color: theme.colorScheme.error,),
                ),
              ),
            ),
            SizedBox(height: 3.v),
            Divider(
              color: appTheme.gray30001,
            ),
            SizedBox(height: 19.v),
            Padding(
              padding: EdgeInsets.only(
                left: 15.h,
                right: 9.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    ImageConstant.imgPngBasketSvg,
                    height: 25.v,
                    width: 25.h,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  SizedBoxView(width: 10.h),
                  Text(
                    "Selling",
                    style: TextStyle(
                        fontSize: 16.h, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3.3,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder13,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    child: Text(
                      "Open",
                      style: CustomTextStyles.titleSmallPrimary.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 41.h),
                child: Text(
                  "1 Items",
                  //  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
            SizedBox(height: 11.v),
            Divider(
              color: appTheme.gray30001,
            ),
            SizedBox(height: 5.v),*/
          ],
        ),
      ),
    );
  }

  ///
  /// Section Widget
/*
  Widget _buildActiveValue(BuildContext context) {
    return SizedBox(
      height: 54.v,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              decoration: AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder7,
                border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.v,
                      right: 12.h,
                      bottom: 15.v,
                      left: 12.h,
                    ),
                    child: Text(
                      "Active",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.v,
                      right: 12.h,
                      bottom: 15.v,
                    ),
                    child: Text(
                      "Closed",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 70.h,
              child: Divider(
                color: appTheme.black900,
                indent: 6.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
*/
}
