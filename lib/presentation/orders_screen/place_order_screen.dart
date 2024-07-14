import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:prayas_capital/presentation/watchlist_screen/watchlist_screen.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String titleName;
  final String subTitleName;
  final String price;
  final String percentage;
  final String high;
  final String low;
  final String exchange;
  final String lastTradeTime;

  PlaceOrderScreen({
    required this.titleName,
    required this.subTitleName,
    required this.price,
    required this.percentage,
    required this.high,
    required this.low,
    required this.exchange,
    required this.lastTradeTime,
  });

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final TextEditingController lotsTextEditingController = TextEditingController();
  final TextEditingController enterPriceTextEditingController = TextEditingController();
  final FocusNode lotsFocusNode = FocusNode();
  final FocusNode enterPriceFocusNode = FocusNode();

  String orderNature = 'Regular';
  String orderType = 'Market';

  @override
  void initState() {
    super.initState();
    enterPriceTextEditingController.value = TextEditingValue(text: widget.price);
  }

  void handleAddButton(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('http://prayascapital.com:5000/orders/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Order Saved Successfully'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.body),
      ));
    }
  }

  void submitOrder(String order) {
    final String lots = lotsTextEditingController.text;
    final String price = enterPriceTextEditingController.text;
    final Map<String, dynamic> item = {
      'lots': lots,
      'price': price,
      'unique_name': widget.titleName,
      'nature': orderNature,
      'type': orderType,
      'quantity': 2,
      'user_id': 1,
      'ip_address': '192.168.667.332',
      'order_method': order,
    };

    handleAddButton(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Place Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                option_details_widget(
                  context: context,
                  titleName: widget.titleName,
                  subTitleName: widget.subTitleName,
                  price: widget.price,
                  percentage: widget.percentage,
                  high: widget.high,
                  low: widget.low,
                  exchange: widget.exchange,
                  lastTradeTime: widget.lastTradeTime,
                ),
                Padding(
                  padding: EdgeInsets.only(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                                        color: Colors.black,
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text("Lot: 50"),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text("Tick: 0.05"),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
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
                                                  ? Colors.black
                                                  : Colors.black38,
                                              fontWeight: lotsFocusNode.hasFocus
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                )),
                                            focusColor: Colors.black,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black38,
                                                )),
                                            alignLabelWithHint: true,
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
                                          controller: enterPriceTextEditingController,
                                          decoration: InputDecoration(
                                            label: Text("Enter Price"),
                                            labelStyle: TextStyle(
                                              color: enterPriceFocusNode.hasFocus
                                                  ? Colors.black
                                                  : Colors.black38,
                                              fontWeight: enterPriceFocusNode.hasFocus
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                )),
                                            focusColor: Colors.black,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black38,
                                                )),
                                            alignLabelWithHint: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 20),
                              Text(
                                "Order Nature",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        orderNature = 'Regular';
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width / 2.7,
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide()),
                                        color: orderNature == 'Regular' ? Colors.blue : Colors.white,
                                      ),
                                      child: Center(child: Text("Regular")),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        orderNature = 'Stop Loss';
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width / 2.7,
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide()),
                                        color: orderNature == 'Stop Loss' ? Colors.blue : Colors.white,
                                      ),
                                      child: Center(child: Text("Stop Loss")),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Type",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        orderType = 'Market';
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width / 4,
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide()),
                                        color: orderType == 'Market' ? Colors.blue : Colors.white,
                                      ),
                                      child: Center(child: Text("Market")),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        orderType = 'Limit';
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width / 4,
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide()),
                                        color: orderType == 'Limit' ? Colors.blue : Colors.white,
                                      ),
                                      child: Center(child: Text("Limit")),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        orderType = 'Practice';
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.sizeOf(context).width / 4,
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide()),
                                        color: orderType == 'Practice' ? Colors.blue : Colors.white,
                                      ),
                                      child: Center(child: Text("Practice")),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Approx. margin (Buy)",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Approx. margin (Sell)",
                                          style: TextStyle(
                                            color: Colors.black,
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
                                  ElevatedButton(
                                    onPressed: () {
                                      submitOrder('buy');
                                    },
                                    child: Text("BUY"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.green,
                                      elevation: 0,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      submitOrder('sell');
                                    },
                                    child: Text("SELL"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.red,
                                      elevation: 0,
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

Widget option_details_widget({
  required BuildContext context,
  required String titleName,
  required String subTitleName,
  required String price,
  required String percentage,
  required String high,
  required String low,
  required String exchange,
  required String lastTradeTime,
}) {
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
              name: titleName,
              value: subTitleName,
              CrossAxisAlignment: CrossAxisAlignment.start,
            ),
            option_details_text_widget(
              name: price,
              value: percentage,
              CrossAxisAlignment: CrossAxisAlignment.end,
            ),
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
              value: high,
              CrossAxisAlignment: CrossAxisAlignment.center,
            ),
            option_details_text_widget(
              name: 'High',
              value: high,
              CrossAxisAlignment: CrossAxisAlignment.center,
            ),
            option_details_text_widget(
              name: 'Low',
              value: low,
              CrossAxisAlignment: CrossAxisAlignment.center,
            ),
            option_details_text_widget(
              name: 'Prev.close',
              value: high,
              CrossAxisAlignment: CrossAxisAlignment.center,
            ),
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
              CrossAxisAlignment: CrossAxisAlignment.center,
            ),
            option_details_text_widget(
              name: 'Change in Oi',
              value: '+2185',
              CrossAxisAlignment: CrossAxisAlignment.center,
            ),
          ],
        ),
        SizedBoxView(height: 10),
        DividerView(),
        SizedBoxView(height: 200),
      ],
    ),
  );
}

Widget option_details_text_widget({
  required String name,
  required String value,
  required CrossAxisAlignment CrossAxisAlignment,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment,
    children: [
      TextView(text: name),
      SizedBoxView(height: 5),
      TextView(text: value),
    ],
  );
}
