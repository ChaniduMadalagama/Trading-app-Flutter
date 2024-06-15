import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/nifty50_banknifty_widget.dart';
import 'package:prayas_capital/presentation/selling_screen/Widget/PositionScreenListViewWidget.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';

import 'package:prayas_capital/core/utils/ColorFile.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';
import '../appBar_Widget/appBar_widget.dart';

class PositionScreen extends StatelessWidget {
  const PositionScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
      brightness: Brightness.dark,
    );
    return Scaffold(
      appBar: CustomeAppBar(appBarTitle: MyString.position, context: context),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildRecentOrders(context, MyString.net_Position),
              Container(
                alignment: Alignment.center,
                height: 90.h,
                child: Stack(
                  children: [
                    Container(
                      height: 45.h,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        elevation: 10,
                        child: InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 1.3,
                            decoration:
                                AppDecoration.fillOnPrimaryContainer.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder7,
                              border: Border.all(color: AppColors.white),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 5.v),
                                Text(
                                  MyString.total_PL,
                                  //style: theme.textTheme.,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 2.h),
                                    child: Text(
                                      "2044.65",
                                      style: CustomTextStyles.bodyMediumRedA700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 24.v),
              // SizedBox(height: 30),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 0.5,
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      PositionScreenListViewWidget(
                        titleName: 'NIFTY 17500 CE',
                        subTitleName: '16-Nov NFO',
                        price: '2044.65',
                        lpt: '2044.65',
                        ipoOpenClose: 'Open',
                        date: 'Avg. 100.78',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
