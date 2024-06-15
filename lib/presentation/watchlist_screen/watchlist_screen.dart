import 'package:page_transition/page_transition.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/buy_screen/buy_screen.dart';
import 'package:prayas_capital/presentation/orders_screen/place_order_screen.dart';
import 'package:prayas_capital/widgets/App.dart';

import '../watchlist_screen/widgets/stockinfo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_search_view.dart';

import 'widgets/WatchListListViewWidget.dart';

class WatchlistScreen extends StatelessWidget {
  WatchlistScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: PlaceOrderScreen()));

                    },
                    child: Column(
                      children: [
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        WatchListListViewWidget(
                          titleName: 'NIFTY 17500 CE',
                          subTitleName: '16-Nov NFO',
                          price: '2044.65',
                          percentage: '-469.10(-18.86%)',
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
