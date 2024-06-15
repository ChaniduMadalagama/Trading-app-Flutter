/*
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../core/utils/ColorFile.dart';
import '../../core/utils/StringFile.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';
import '../../widgets/custom_outlined_button.dart';
import '../orders_screen/place_order_screen.dart';

class PendingOrderDetailScreen extends StatefulWidget {
  PendingOrderDetailScreen({Key? key})
      : super(
          key: key,
        );
  @override
  State<PendingOrderDetailScreen> createState() =>
      _PendingOrderDetailScreenState();
}

class _PendingOrderDetailScreenState extends State<PendingOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            TextView(text: MyString.orderDetails, textColor: AppColors.white),
      ),
      body: Column(
        children: [
          Stack(children: [
            option_details_widget(context: context),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height /3.8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(20),
                elevation: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      orderDetailRowCustom(title: "Status", titleValue: "Pending", titleValueStyle: TextStyle(
                         color: AppColors.orangeShade5,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: DividerView(
                          color: AppColors.grey,
                          thickness: 1.5
                        ),
                      ),
                      orderDetailRowCustom(title: "Order", titleValue: "BUY", titleValueStyle: TextStyle(
                        color: AppColors.green,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: DividerView(
                            color: AppColors.grey,
                            thickness: 1.5
                        ),
                      ),
                      orderDetailRowCustom(title: "Order Type", titleValue: "LIMIT", titleValueStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackShade9,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: DividerView(
                            color: AppColors.grey,
                            thickness: 1.5
                        ),
                      ),
                      orderDetailRowCustom(title: "Lot Size", titleValue: "50", titleValueStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackShade9,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: DividerView(
                            color: AppColors.grey,
                            thickness: 1.5
                        ),
                      ),
                      orderDetailRowCustom(title: "Order Quantity", titleValue: "1", titleValueStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackShade9,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: DividerView(
                            color: AppColors.grey,
                            thickness: 1.5
                        ),
                      ),
                      orderDetailRowCustom(title: "Order Price", titleValue: "3548.15", titleValueStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackShade9,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: DividerView(
                            color: AppColors.grey,
                            thickness: 1.5
                        ),
                      ),
                      orderDetailRowCustom(title: "Order Time", titleValue: "04:05:37 PM", titleValueStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackShade9,
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          SizedBoxView(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.green,
                    ),
                  ),
                  child: TextView(text: "Modify Order",textColor: AppColors.green,textSize: 15),
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.red
                    ),
                  ),
                  child: TextView(text:"Cancel Order",textSize: 15,textColor: AppColors.red),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

  Widget orderDetailRowCustom({
    required String title,
    required String titleValue,
    required TextStyle titleValueStyle,
}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 16,
            color: AppColors.blackShade9,
            fontWeight: FontWeight.w500,
          ),),
          Text(titleValue,style: titleValueStyle),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../core/utils/ColorFile.dart';
import '../../core/utils/StringFile.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';
import '../../widgets/custom_outlined_button.dart';
import '../orders_screen/place_order_screen.dart';

class PendingOrderDetailScreen extends StatefulWidget {
  PendingOrderDetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<PendingOrderDetailScreen> createState() =>
      _PendingOrderDetailScreenState();
}

class _PendingOrderDetailScreenState extends State<PendingOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            TextView(text: MyString.orderDetails, textColor: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              option_details_widget(context: context),
              Padding(
                padding: EdgeInsets.only(
                //    top: MediaQuery.sizeOf(context).height / 3.4.h,
                top: 218.h
                ),
                child: SingleChildScrollView(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(20.h),
                    elevation: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 300.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          orderDetailRowCustom(
                              title: "Status",
                              titleValue: "Pending",
                              titleValueStyle: TextStyle(
                                color: AppColors.orangeShade5,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.h),
                            child: DividerView(
                                color: AppColors.grey, thickness: 1.5),
                          ),
                          orderDetailRowCustom(
                              title: "Order",
                              titleValue: "BUY",
                              titleValueStyle: TextStyle(
                                color: AppColors.green,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.h),
                            child: DividerView(
                                color: AppColors.grey, thickness: 1.5),
                          ),
                          orderDetailRowCustom(
                              title: "Order Type",
                              titleValue: "LIMIT",
                              titleValueStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackShade9,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.h),
                            child: DividerView(
                                color: AppColors.grey, thickness: 1.5),
                          ),
                          orderDetailRowCustom(
                              title: "Lot Size",
                              titleValue: "50",
                              titleValueStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackShade9,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.h),
                            child: DividerView(
                                color: AppColors.grey, thickness: 1.5),
                          ),
                          orderDetailRowCustom(
                              title: "Order Quantity",
                              titleValue: "1",
                              titleValueStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackShade9,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.h),
                            child: DividerView(
                                color: AppColors.grey, thickness: 1.5),
                          ),
                          orderDetailRowCustom(
                              title: "Order Price",
                              titleValue: "3548.15",
                              titleValueStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackShade9,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.h),
                            child: DividerView(
                                color: AppColors.grey, thickness: 1.5),
                          ),
                          orderDetailRowCustom(
                              title: "Order Time",
                              titleValue: "04:05:37 PM",
                              titleValueStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackShade9,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBoxView(height: 10.h),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.green,
                        ),
                      ),
                      child: TextView(
                          text: "Modify Order",
                          textColor: AppColors.green,
                          textSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.red),
                      ),
                      child: TextView(
                          text: "Cancel Order",
                          textSize: 15,
                          textColor: AppColors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderDetailRowCustom({
    required String title,
    required String titleValue,
    required TextStyle titleValueStyle,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.h,
              color: AppColors.blackShade9,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(titleValue, style: titleValueStyle),
        ],
      ),
    );
  }
}
