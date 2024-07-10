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
import 'dart:convert';
import 'package:http/http.dart' as http;

class PositionScreen extends StatelessWidget {
  const PositionScreen({Key? key})
      : super(
    key: key,
  );

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.post(Uri.parse('http://prayascapital.com:5000/orders/latest'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': 1
      }),);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

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
              FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No data available');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        return Column(
                          children: [
                            Container(
                              height: 0.5,
                              width: double.infinity,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            PositionScreenListViewWidget(
                              titleName: item['unique_name'],
                              subTitleName: item['unique_name'],
                              price: item['price'],
                              lpt: 'N/A',
                              ipoOpenClose: item['open'] == 1 ? 'Open' : 'Close',
                              date: item['created_at'],
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
