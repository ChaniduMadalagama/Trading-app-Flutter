import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/nifty50_banknifty_widget.dart';
import 'package:prayas_capital/presentation/option_chain_screen/Widget/option_chain_total_price.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../widgets/App.dart';
import 'Widget/ltp_change_widget.dart';
import 'Widget/ol_change_widget.dart';
import 'Widget/option_chain_listview_widget.dart';
import 'Widget/strike_widget.dart';

class OptionChainScreen extends StatefulWidget {
  @override
  State<OptionChainScreen> createState() => _OptionChainScreenState();
}

class _OptionChainScreenState extends State<OptionChainScreen> {
  String indexLabel = 'NIFTY';
  String expiryLabel = '15-Feb-2024';
  var index = [
    'NIFTY',
    'BANKNIFTY',
  ];
  var expiry = [
    '15-Feb-2024',
    '22-Feb-2024',
    '29-Feb-2024',
    '07-Mar-2024',
    '14-Mar-2024',
    '28-Mar-2024',
    '25-Apr-2024',
  ];

  int? arrayIndex;

  @override
  Widget build(BuildContext context) {
    final double boxHeight = 55.h;
    final double strikeBoxHeight = 40.h;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: TextView(
          text: MyString.option_chain,
          textSize: 20.h,
          textColor: AppColors.white,
        ),
      ),
      body: Column(
        children: [
          niftyAndBankNiftyWidget(),
          SizedBoxView(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(text: MyString.Index, textSize: 13.h),
                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: DropdownButton(
                        value: indexLabel,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        items: index.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        /*style: TextStyle(
                          fontSize: 15.h
                        ),*/
                        onChanged: (String? newValue) {
                          setState(() {
                            indexLabel = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBoxView(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(text: MyString.Expiry, textSize: 13.h),
                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: DropdownButton(
                        value: expiryLabel,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        items: expiry.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            expiryLabel = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBoxView(height: 5),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(color: AppColors.green),
                  child: TextView(
                      text: MyString.CALL,
                      textColor: AppColors.white,
                      textSize: 15.h),
                ),
                Icon(
                  Icons.pages,
                  size: 28.h,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(color: AppColors.red),
                  child: TextView(
                      text: MyString.PUT,
                      textColor: AppColors.white,
                      textSize: 15.h),
                ),
              ],
            ),
          ),
          SizedBoxView(height: 10),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OlChangewidget(boxHeight: boxHeight),
                SizedBoxView(width: 5.h),
                ltpChangeWidget(boxHeight: boxHeight),
                SizedBoxView(width: 5.h),
                strikeWidget(boxHeight: boxHeight),
                SizedBoxView(width: 5.h),
                ltpChangeWidget(boxHeight: boxHeight),
                SizedBoxView(width: 5.h),
                OlChangewidget(boxHeight: boxHeight),
              ],
            ),
          ),
          SizedBoxView(width: 10),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  arrayIndex = index;
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OlOptionChainWidget(
                                        boxHeight: boxHeight,
                                        topValue: '10',
                                        bottomValue: '-39'),
                                    SizedBoxView(width: 5),
                                    LtpOptionChainWidget(
                                      boxHeight: boxHeight,
                                      topValue: '2398.45',
                                      bottomValue: '+2.72%',
                                    ),
                                    SizedBoxView(width: 5),
                                    StrikeWidget(
                                        boxHeight: strikeBoxHeight,
                                        totalPrice: "21000"),
                                    SizedBoxView(width: 5),
                                    LtpOptionChainWidget(
                                      boxHeight: boxHeight,
                                      topValue: '0.05',
                                      bottomValue: '-90.91%',
                                    ),
                                    SizedBoxView(width: 5),
                                    OlOptionChainWidget(
                                        boxHeight: boxHeight,
                                        topValue: '41,172',
                                        bottomValue: '-30,476'),
                                  ],
                                ),
                              ),
                              arrayIndex == 10
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            color: AppColors.black,
                                            height: 3,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            decoration: BoxDecoration(
                                              color: AppColors.black,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextView(
                                                text: "Spot 21927.35(+0.40%)",
                                                textColor: AppColors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: AppColors.black26,
                                      height: 1,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: TotalOptionPrice(),
    );
  }
}
