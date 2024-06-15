import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';
import '../search_screen/widgets/stockinfolist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/custom_search_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        title: TextView(
            text: MyString.search,
            fontWeight: FontWeight.w800,
            textSize: 25,
            textColor: AppColors.white),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            //   SizedBox(height: 36.v),
            Container(
              height: 70.h,
              child: Stack(
                children: [
                  SizedBoxView(height: 30),
                  Container(
                    height: 50.h,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 10,
                      child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              //style: TextStyle(color: AppColors.black),
                              cursorColor: AppColors.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search_rounded,color: AppColors.black),
                                border: InputBorder.none,
                                hintText: MyString.search_Option,
                                hintStyle: TextStyle(color: AppColors.black)
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8.v),
                    _buildStockInfoList(context),
                    SizedBox(height: 319.v),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStockInfoList(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0.v),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        );
      },
      itemCount: 2,
      itemBuilder: (context, index) {
        return StockinfolistItemWidget();
      },
    );
  }
}
