import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/nifty50_banknifty_widget.dart';
import 'package:prayas_capital/presentation/orders_screen/Widget/tebBar_widget.dart';

import '../appBar_Widget/appBar_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;


  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(appBarTitle: MyString.orders, context: context),
      body: SizedBox(
        width: SizeUtils.width,
        child: Column(
          children: [
            buildRecentOrders(context, MyString.orders),
            Expanded(
              child: TabBarWidgwtOrderScreen(),
            ),
          ],
        ),
      ),
    );
  }


}
