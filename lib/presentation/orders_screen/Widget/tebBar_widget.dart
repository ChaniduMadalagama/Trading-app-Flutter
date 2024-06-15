import 'package:flutter/material.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';

class TabBarWidgwtOrderScreen extends StatefulWidget {
  const TabBarWidgwtOrderScreen({key});

  @override
  State<TabBarWidgwtOrderScreen> createState() =>
      _TabBarWidgwtOrderScreenState();
}

class _TabBarWidgwtOrderScreenState extends State<TabBarWidgwtOrderScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Card(
                color: AppColors.white,
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
                      Tab(text: MyString.pending),
                      Tab(text: MyString.execute),
                      Tab(text: MyString.cancelled),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text(
                    'No Pending orders',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'No executed orders',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'No cancelled orders',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
