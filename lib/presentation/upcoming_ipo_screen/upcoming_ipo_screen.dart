import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/more_screen/Widget/ipo_listview_widget.dart';
import 'package:prayas_capital/widgets/TextView.dart';

import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Controller/app_theme/ThemeModel.dart';

class UpcomingIpoScreen extends StatefulWidget {
  @override
  State<UpcomingIpoScreen> createState() => _UpcomingIpoScreenState();
}

class _UpcomingIpoScreenState extends State<UpcomingIpoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final ipoControlll = Provider.of<ThemeModel>(context, listen: false);
    ipoControlll.getIpoDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        title: Text(
          MyString.IPO,
          style: TextStyle(
              fontSize: 21.h,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: TextView(
                    text: MyString.Upcoming_Ipo,
                    textSize: 20,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: AppColors.greyShade8,
            ),
            Consumer<ThemeModel>(
              builder: (BuildContext context, value, Widget? child) {
                return value.ipoListData!.length == 0
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.black87,
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                IpoListViewWidget(
                                  Name: 'Name',
                                  subTitleName: "Close",
                                  price:
                                      '${MyString.rupeeSymbol}00.00 - ${MyString.rupeeSymbol}00.00',
                                  date: '00-00-0000 - 00-00-0000',
                                ),
                                Container(
                                  height: 0.5,
                                  width: double.infinity,
                                  color: AppColors.greyShade8,
                                ),
                              ],
                            );
                          },
                        ))
                    : ListView.builder(
                        itemCount: value.ipoListData!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              IpoListViewWidget(
                                Name: value.ipoListData![index].name.toString(),
                                subTitleName:
                                    value.ipoListData![index].status == 0
                                        ? "Open"
                                        : "Close",
                                price:
                                    '${MyString.rupeeSymbol}${value.ipoListData![index].startPrice.toString()} - ${MyString.rupeeSymbol}${value.ipoListData![index].endPrice.toString()} ',
                                date:
                                    '${value.ipoListData![index].startDate.toString()} -${value.ipoListData![index].endDate.toString()} ',
                              ),
                              Container(
                                height: 0.5,
                                width: double.infinity,
                                color: AppColors.greyShade8,
                              ),
                            ],
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
