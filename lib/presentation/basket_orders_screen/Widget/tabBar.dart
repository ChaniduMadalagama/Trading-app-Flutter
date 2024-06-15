import 'package:flutter/material.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/active_basket_screen.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/close_basket.dart';

class TabBarWidgwtBasketScreen extends StatefulWidget {
  const TabBarWidgwtBasketScreen({key});

  @override
  State<TabBarWidgwtBasketScreen> createState() =>
      _TabBarWidgwtBasketScreenState();
}

class _TabBarWidgwtBasketScreenState extends State<TabBarWidgwtBasketScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Column(
        children: [
          Stack(alignment: Alignment.topCenter,
              children: [
              Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.15,
                child: TabBar(
                  unselectedLabelColor: Colors.black38,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'Active'),
                    Tab(text: 'Closed'),
                  ],
                ),
              ),
            ),
          ]),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(child: ActiveBasket()),
                SingleChildScrollView(child: CloseBasket()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
