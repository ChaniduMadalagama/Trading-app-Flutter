import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/Widget/active_closed_listview_custom.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/active_basket_detail_screen.dart';

import '../../widgets/App.dart';

class ActiveBasket extends StatefulWidget {
  ActiveBasket({Key? key})
      : super(
          key: key,
        );
  @override
  State<ActiveBasket> createState() => _ActiveBasketState();
}

class _ActiveBasketState extends State<ActiveBasket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBoxView(height: 100),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ActiveBasketDetailsScreen()));
          },
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return activeClosedListViewCustom(
                    basketTitle: "Demo Title",
                    rightTitle: "Created",
                    rightTitleBackgroundColor: AppColors.greyShade10,
                    rightTitleTextColor: AppColors.white,
                    rightTitleBorderColor: AppColors.black,
                    date: "Created on 20 January 2024",
                    item: '1');
/*
                  Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18, left: 10),
                          child: SvgPicture.asset(
                            ImageConstant.imgPngBasketSvg,
                            height: 25.v,
                            width: 25.h,
                          ),
                        ),
                        SizedBoxView(width: 10.h),
                        Text(
                          "Demo",
                          style: TextStyle(
                              fontSize: 16.h, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 17.h,
                            vertical: 1.v,
                          ),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            border: Border.fromBorderSide(
                                BorderSide(color: AppColors.black)),
                            color: AppColors.greyShade10,
                          ),
                          child: Text(
                            "Created",
                            style: CustomTextStyles.titleSmallPrimary.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 45.h),
                          child: Text(
                            "Created on 24 February 2024",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.UsernameColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 15.h),
                          child: Text(
                            "1 Items",
                            //  style: theme.textTheme.titleSmall,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.UsernameColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
*/
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.grey,
                );
              },
              itemCount: 5),
        ),
      ],
    );
  }
}
