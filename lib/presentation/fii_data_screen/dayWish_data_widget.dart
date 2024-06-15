import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/TextView.dart';

class DayWishDataWidget extends StatefulWidget {
  @override
  State<DayWishDataWidget> createState() => _DayWishDataWidgetState();
}

class _DayWishDataWidgetState extends State<DayWishDataWidget> {
  @override
  Widget build(BuildContext context) {
    double listHeadSize = MediaQuery.of(context).size.width / 3;
    double listHeadHeightSize = 45;
    Alignment alignment = Alignment.center;
    double listHeadTextSize = 18.h;
    FontWeight fontWeight = FontWeight.w400;
    Color listTextHeadColor = AppColors.white;
    Color listHeadColor = AppColors.appColor1;

    return Scaffold(
      appBar: AppBar(
        title: TextView(
          text: MyString.dayWiseData,
          textColor: AppColors.white,
          textSize: 21.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 1
                  ? Container(
                      // decoration: BoxDecoration(color: AppColors.appColor1),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                              ),
                            ),
                            alignment: alignment,
                            height: listHeadHeightSize,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            width: listHeadSize,
                            child: TextView(
                              text: "Date",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                            ),
                            alignment: alignment,
                            width: listHeadSize,
                            height: listHeadHeightSize,
                            child: TextView(
                              text: "FII Call",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                            ),
                            alignment: alignment,
                            width: listHeadSize,
                            height: listHeadHeightSize,
                            child: TextView(
                              text: "FII Put",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                            ),
                            alignment: alignment,
                            height: listHeadHeightSize,
                            width: listHeadSize,
                            child: TextView(
                              text: "FII Future",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                            ),
                            alignment: alignment,
                            width: listHeadSize,
                            height: listHeadHeightSize,
                            child: TextView(
                              text: "FII Future OI",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                            ),
                            alignment: alignment,
                            width: listHeadSize,
                            height: listHeadHeightSize,
                            child: TextView(
                              text: "FII Call",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: listHeadColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                              ),
                            ),
                            alignment: alignment,
                            width: listHeadSize,
                            height: listHeadHeightSize,
                            child: TextView(
                              text: "DII Call",
                              textSize: listHeadTextSize,
                              fontWeight: fontWeight,
                              textColor: listTextHeadColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),

              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    alignment: alignment,
                    height: listHeadHeightSize,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: listHeadSize,
                    child: TextView(
                      text: "Date",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                    ),
                    alignment: alignment,
                    width: listHeadSize,
                    height: listHeadHeightSize,
                    child: TextView(
                      text: "FII Call",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                    ),
                    alignment: alignment,
                    width: listHeadSize,
                    height: listHeadHeightSize,
                    child: TextView(
                      text: "FII Put",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                    ),
                    alignment: alignment,
                    height: listHeadHeightSize,
                    width: listHeadSize,
                    child: TextView(
                      text: "FII Future",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                    ),
                    alignment: alignment,
                    width: listHeadSize,
                    height: listHeadHeightSize,
                    child: TextView(
                      text: "FII Future OI",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                    ),
                    alignment: alignment,
                    width: listHeadSize,
                    height: listHeadHeightSize,
                    child: TextView(
                      text: "FII Call",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: listHeadColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                      ),
                    ),
                    alignment: alignment,
                    width: listHeadSize,
                    height: listHeadHeightSize,
                    child: TextView(
                      text: "DII Call",
                      textSize: listHeadTextSize,
                      fontWeight: fontWeight,
                      textColor: listTextHeadColor,
                    ),
                  ),
                ],
              ),

            ],
          );
        },
      ),
    );
  }
}
