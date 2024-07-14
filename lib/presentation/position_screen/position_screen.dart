import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/nifty50_banknifty_widget.dart';
import 'package:prayas_capital/presentation/selling_screen/Widget/PositionScreenListViewWidget.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:provider/provider.dart';
import 'package:prayas_capital/auth/UserProvider.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';
import '../appBar_Widget/appBar_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Define a structured result to hold both userOrders and summary
class ResponseData {
  final List<Map<String, dynamic>> userOrders;
  final Map<String, dynamic> summary;

  ResponseData({required this.userOrders, required this.summary});
}

class PositionScreen extends StatefulWidget {
  const PositionScreen({Key? key}) : super(key: key);

  @override
  State<PositionScreen> createState() => _PositionScreenState();
}

class _PositionScreenState extends State<PositionScreen> {
  late Future<ResponseData> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData(context);
  }

  Future<ResponseData> fetchData(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userId = userProvider.user?.user_id; // Assuming the UserModel has an id property

    if (userId == null) {
      throw Exception('User ID is null');
    }

    final response = await http.post(
      Uri.parse('http://prayascapital.com:5000/orders/latest'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'user_id': userId}),
    );

    if (response.statusCode == 200) {
      // Decode the JSON response body
      Map<String, dynamic> data = json.decode(response.body);

      // Extract and process userOrders
      List<Map<String, dynamic>> userOrders = [];
      if (data.containsKey('userOrders') && data['userOrders'] is List) {
        userOrders = data['userOrders']
            .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
            .toList();
      }

      // Extract summary
      Map<String, dynamic> summary = {};
      if (data.containsKey('summary') && data['summary'] is Map) {
        summary = data['summary'] as Map<String, dynamic>;
      }

      // Return the structured result
      return ResponseData(userOrders: userOrders, summary: summary);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _futureData = fetchData(context);
    });
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
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildRecentOrders(context, MyString.net_Position),
                FutureBuilder<ResponseData>(
                  future: _futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('No data available'));
                    } else {
                      var responseData = snapshot.data!;
                      return Column(
                        children: [
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
                                        decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
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
                                                  responseData.summary['total_lp'].toString(),
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
                          ListView.builder(
                            itemCount: responseData.userOrders.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = responseData.userOrders[index];
                              return Column(
                                children: [
                                  Container(
                                    height: 0.5,
                                    width: double.infinity,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  ),
                                  PositionScreenListViewWidget(
                                    id: item['id'],
                                    titleName: item['name'],
                                    subTitleName: item['created_at'],
                                    price: item['price'],
                                    lpt: item['price'],
                                    qty: item['quantity'],
                                    ipoOpenClose: item['open'] == 1 ? 'Open' : 'Close',
                                    date: item['created_at'],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
