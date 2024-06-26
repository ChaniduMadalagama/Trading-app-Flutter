/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  TextEditingController? lotsTextEditingController;
  TextEditingController? enterPriceTextEditingController;
  late FocusNode lotsFocusNode;
  late FocusNode enterPriceFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lotsTextEditingController = TextEditingController(text: "1");
    enterPriceTextEditingController = TextEditingController(text: "0.40");
    lotsFocusNode = FocusNode();
    enterPriceFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextView(text: MyString.placeOrder, textColor: AppColors.white),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              option_details_widget(context: context),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height / 4.2),
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
                    height: MediaQuery.sizeOf(context).height / 1.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 50.h,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: AppColors.blackShade2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                    color: AppColors.blackShade9,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                TextView(
                                    text: "Lot: 50",
                                    fontWeight: FontWeight.w400,
                                    textColor: AppColors.blackShade9,
                                    textSize: 13),
                                Text(
                                  "Price",
                                  style: TextStyle(
                                    color: AppColors.blackShade9,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                TextView(
                                    text: "Tick: 0.05",
                                    fontWeight: FontWeight.w400,
                                    textColor: AppColors.blackShade9,
                                    textSize: 13),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 2.7,
                                  height: MediaQuery.sizeOf(context).width / 6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      focusNode: lotsFocusNode,
                                      controller: lotsTextEditingController,
                                      decoration: InputDecoration(
                                        label: Text("Enter Lots"),
                                        labelStyle: TextStyle(
                                          color: lotsFocusNode.hasFocus
                                              ? AppColors.black
                                              : AppColors.blackShade9,
                                          fontWeight: lotsFocusNode.hasFocus
                                              ? FontWeight.w500
                                              : FontWeight.w400,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.blackShade9),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.black,
                                          width: 2,
                                        )),
                                        focusColor: AppColors.black,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.blackShade9,
                                        )),
                                        alignLabelWithHint: true,
                                        // labelText: "Enter Lots"
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 2.7,
                                  height: MediaQuery.sizeOf(context).width / 6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      enableInteractiveSelection: false,
                                      enabled: false,
                                      readOnly: true,
                                      focusNode: enterPriceFocusNode,
                                      controller:
                                          enterPriceTextEditingController,
                                      decoration: InputDecoration(
                                        label: Text("Enter Price"),
                                        labelStyle: TextStyle(
                                          color: enterPriceFocusNode.hasFocus
                                              ? AppColors.black
                                              : AppColors.blackShade9,
                                          fontWeight:
                                              enterPriceFocusNode.hasFocus
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.blackShade9),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.black,
                                          width: 2,
                                        )),
                                        focusColor: AppColors.black,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.blackShade9,
                                        )),
                                        alignLabelWithHint: true,
                                        // labelText: "Enter Lots"
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Order Nature",
                            style: TextStyle(
                              color: AppColors.blackShade9,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.sizeOf(context).width / 2.7,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide()),
                                ),
                                child: Center(child: Text("Regular")),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.sizeOf(context).width / 2.7,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide()),
                                ),
                                child: Center(child: Text("Stop Loss")),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Type",
                            style: TextStyle(
                              color: AppColors.blackShade9,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.sizeOf(context).width / 4,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide()),
                                ),
                                child: Center(child: Text("Market")),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.sizeOf(context).width / 4,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide()),
                                ),
                                child: Center(child: Text("Limit")),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.sizeOf(context).width / 4,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide()),
                                ),
                                child: Center(child: Text("Practices")),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Approx. margin (Buy)",
                                      style: TextStyle(
                                        color: AppColors.blackShade9,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Approx. margin (Sell)",
                                      style: TextStyle(
                                        color: AppColors.blackShade9,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("₹ 22.50"),
                                    Text("₹ 00.00"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 2.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: AppColors.green,
                                    ),
                                  ),
                                  child: TextView(text: "BUY",textColor: AppColors.green,textSize: 24),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 2.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColors.red
                                    ),
                                  ),
                                  child: TextView(text:"SELL",textSize: 24,textColor: AppColors.red),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget option_details_widget({required context}) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
        Container(
          width: 50.h,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.blackShade2,
          ),
        ),
        SizedBoxView(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            option_details_text_widget(
                name: 'NIFTY 18700PE',
                value: '29-Feb-2024 FNO',
                CrossAxisAlignment: CrossAxisAlignment.start),
            option_details_text_widget(
                name: '0.25',
                value: '-0.30(-54.55%)',
                CrossAxisAlignment: CrossAxisAlignment.end),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            option_details_text_widget(
                name: 'Open',
                value: '0.45',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'High',
                value: '0.60',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'Low',
                value: '0.20',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'Prev.close',
                value: '0.55',
                CrossAxisAlignment: CrossAxisAlignment.center),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextView(text: "Option Chain"),
            option_details_text_widget(
                name: 'Oi',
                value: '4734',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'Change in Oi',
                value: '+2185',
                CrossAxisAlignment: CrossAxisAlignment.center),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 200),
      ],
    ),
  );
}

Widget option_details_text_widget(
    {required String name,
    required String value,
    required CrossAxisAlignment}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment,
    children: [
      TextView(text: name),
      SizedBoxView(height: 5),
      TextView(text: value),
    ],
  );
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  TextEditingController? lotsTextEditingController;
  TextEditingController? enterPriceTextEditingController;
  late FocusNode lotsFocusNode;
  late FocusNode enterPriceFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lotsTextEditingController = TextEditingController(text: "1");
    enterPriceTextEditingController = TextEditingController(text: "0.40");
    lotsFocusNode = FocusNode();
    enterPriceFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextView(text: MyString.placeOrder, textColor: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                option_details_widget(context: context),
                Padding(
                  padding: EdgeInsets.only(
                    //  top: MediaQuery.sizeOf(context).height / 4.2,
                    top: 216.h,
                  ),
                  child: SingleChildScrollView(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(20),
                      elevation: 15,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // height: MediaQuery.sizeOf(context).height / 1.9,
                        // height: 300,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      width: 50.h,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: AppColors.blackShade2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Quantity",
                                      style: TextStyle(
                                        color: AppColors.blackShade9,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextView(
                                        text: "Lot: 50",
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.blackShade9,
                                        textSize: 13),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        color: AppColors.blackShade9,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextView(
                                        text: "Tick: 0.05",
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.blackShade9,
                                        textSize: 13),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width / 2.7,
                                      height: MediaQuery.sizeOf(context).width / 6,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          focusNode: lotsFocusNode,
                                          controller: lotsTextEditingController,
                                          decoration: InputDecoration(
                                            label: Text("Enter Lots"),
                                            labelStyle: TextStyle(
                                              color: lotsFocusNode.hasFocus
                                                  ? AppColors.black
                                                  : AppColors.blackShade9,
                                              fontWeight: lotsFocusNode.hasFocus
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.blackShade9),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.black,
                                                  width: 2,
                                                )),
                                            focusColor: AppColors.black,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.blackShade9,
                                                )),
                                            alignLabelWithHint: true,
                                            // labelText: "Enter Lots"
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width / 2.7,
                                      height: MediaQuery.sizeOf(context).width / 6,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          enableInteractiveSelection: false,
                                          enabled: false,
                                          readOnly: true,
                                          focusNode: enterPriceFocusNode,
                                          controller:
                                          enterPriceTextEditingController,
                                          decoration: InputDecoration(
                                            label: Text("Enter Price"),
                                            labelStyle: TextStyle(
                                              color: enterPriceFocusNode.hasFocus
                                                  ? AppColors.black
                                                  : AppColors.blackShade9,
                                              fontWeight:
                                              enterPriceFocusNode.hasFocus
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.blackShade9),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.black,
                                                  width: 2,
                                                )),
                                            focusColor: AppColors.black,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.blackShade9,
                                                )),
                                            alignLabelWithHint: true,
                                            // labelText: "Enter Lots"
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Order Nature",
                                style: TextStyle(
                                  color: AppColors.blackShade9,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.sizeOf(context).width / 2.7,
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide()),
                                    ),
                                    child: Center(child: Text("Regular")),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.sizeOf(context).width / 2.7,
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide()),
                                    ),
                                    child: Center(child: Text("Stop Loss")),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Type",
                                style: TextStyle(
                                  color: AppColors.blackShade9,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.sizeOf(context).width / 4,
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide()),
                                    ),
                                    child: Center(child: Text("Market")),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.sizeOf(context).width / 4,
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide()),
                                    ),
                                    child: Center(child: Text("Limit")),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.sizeOf(context).width / 4,
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide()),
                                    ),
                                    child: Center(child: Text("Practices")),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:  EdgeInsets.only(bottom: 10.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Approx. margin (Buy)",
                                          style: TextStyle(
                                            color: AppColors.blackShade9,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Approx. margin (Sell)",
                                          style: TextStyle(
                                            color: AppColors.blackShade9,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("₹ 22.50"),
                                        Text("₹ 00.00"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 50.h,
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width / 2.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: AppColors.green,
                                        ),
                                      ),
                                      child: TextView(text: "BUY",textColor: AppColors.green,textSize: 24),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width / 2.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColors.red
                                        ),
                                      ),
                                      child: TextView(text:"SELL",textSize: 24,textColor: AppColors.red),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

Widget option_details_widget({required context}) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
        Container(
          width: 50.h,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.blackShade2,
          ),
        ),
        SizedBoxView(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            option_details_text_widget(
                name: 'NIFTY 18700PE',
                value: '29-Feb-2024 FNO',
                CrossAxisAlignment: CrossAxisAlignment.start),
            option_details_text_widget(
                name: '0.25',
                value: '-0.30(-54.55%)',
                CrossAxisAlignment: CrossAxisAlignment.end),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            option_details_text_widget(
                name: 'Open',
                value: '0.45',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'High',
                value: '0.60',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'Low',
                value: '0.20',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'Prev.close',
                value: '0.55',
                CrossAxisAlignment: CrossAxisAlignment.center),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextView(text: "Option Chain"),
            option_details_text_widget(
                name: 'Oi',
                value: '4734',
                CrossAxisAlignment: CrossAxisAlignment.center),
            option_details_text_widget(
                name: 'Change in Oi',
                value: '+2185',
                CrossAxisAlignment: CrossAxisAlignment.center),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 200),
      ],
    ),
  );
}

Widget option_details_text_widget(
    {required String name,
      required String value,
      required CrossAxisAlignment}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment,
    children: [
      TextView(text: name),
      SizedBoxView(height: 5),
      TextView(text: value),
    ],
  );
}
