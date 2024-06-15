import 'package:flutter/material.dart';
import 'package:prayas_capital/Controller/app_theme/ThemeModel.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/appBar_Widget/appBar_widget.dart';
import 'package:prayas_capital/presentation/nifty50_banknifty_widget.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:provider/provider.dart';

import '../watchlist_screen/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final niftyController = Provider.of<ThemeModel>(context, listen: false);

    niftyController.getNiftyData();
    niftyController.getBankNiftyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(appBarTitle: MyString.watchlist, context: context),
      body: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                collapsedHeight: 170.h,
                expandedHeight: 100.h,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: AppColors.appColor,
                  ),
                  child: buildRecentOrders(context, MyString.watchlist),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: _SliverAppBarTabDelegate(
                  child: PreferredSize(
                    // preferredSize: Size.fromHeight(100),
                    preferredSize: Size.fromHeight(125),
                    child: Container(
                      height: 70.h,
                      child: Stack(
                        children: [
                          Container(
                            height: 50.h,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Card(
                              elevation: 10,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.searchScreen);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.white),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 50.h,
                                  child: Row(
                                    children: [
                                      SizedBoxView(width: 15.h),
                                      Icon(
                                        Icons.search_rounded,
                                      ),
                                      SizedBoxView(width: 10.h),
                                      TextView(
                                        text: MyString.searchOption,
                                        textSize: 16.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Expanded(
            child: WatchlistScreen(),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarTabDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarTabDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
