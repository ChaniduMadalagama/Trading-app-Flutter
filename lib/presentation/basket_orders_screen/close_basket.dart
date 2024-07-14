import 'package:flutter/material.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/closed_basket_detail_screen.dart';

import '../../core/utils/ColorFile.dart';
import 'Widget/active_closed_listview_custom.dart';
import 'active_basket_detail_screen.dart';

class CloseBasket extends StatefulWidget {
  CloseBasket({Key? key})
      : super(
    key: key,
  );
  @override
  State<CloseBasket> createState() => _CloseBasketState();
}

class _CloseBasketState extends State<CloseBasket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBoxView(height: 100),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ClosedBasketDetailScreen()));
          },
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return activeClosedListViewCustom(
                    basketTitle: "Demo Title",
                    rightTitle: "Closed",
                    rightTitleBackgroundColor: AppColors.green3,
                    rightTitleTextColor: AppColors.green,
                    rightTitleBorderColor: AppColors.green,
                    date: "Created on 20 January 2024",
                    item: '1');
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.grey,
                );
              },
              itemCount: 5),
        ),
      ],
    );
  }
}
