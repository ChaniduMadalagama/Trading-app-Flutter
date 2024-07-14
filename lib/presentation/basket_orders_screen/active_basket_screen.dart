import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/Widget/active_closed_listview_custom.dart';
import 'package:prayas_capital/presentation/basket_orders_screen/active_basket_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:prayas_capital/auth/UserProvider.dart';

class ActiveBasket extends StatefulWidget {
  ActiveBasket({Key? key}) : super(key: key);

  @override
  State<ActiveBasket> createState() => _ActiveBasketState();
}

class _ActiveBasketState extends State<ActiveBasket> {
  late Future<List<BasketItem>> futureBasketItems;

  @override
  void initState() {
    super.initState();
    futureBasketItems = fetchBasketItems(context);
  }

  Future<List<BasketItem>> fetchBasketItems(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userId = userProvider.user?.user_id;
    final response = await http.get(Uri.parse('http://prayascapital.com:5000/baskets/active/${userId}'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => BasketItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load basket items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BasketItem>>(
      future: futureBasketItems,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActiveBasketDetailsScreen(),
                    ),
                  );
                },
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    BasketItem item = snapshot.data![index];
                    return activeClosedListViewCustom(
                      basketTitle: item.basketTitle,
                      rightTitle: item.rightTitle,
                      rightTitleBackgroundColor: AppColors.greyShade10,
                      rightTitleTextColor: AppColors.white,
                      rightTitleBorderColor: AppColors.black,
                      date: item.date,
                      item: item.item,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.grey,
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class BasketItem {
  final String basketTitle;
  final String rightTitle;
  final String date;
  final String item;

  BasketItem({
    required this.basketTitle,
    required this.rightTitle,
    required this.date,
    required this.item,
  });

  factory BasketItem.fromJson(Map<String, dynamic> json) {
    return BasketItem(
      basketTitle: json['name'],
      rightTitle: 'Created',
      date: json['created_at'],
      item: '1',
    );
  }
}
