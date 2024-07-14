import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:provider/provider.dart';
import 'package:prayas_capital/auth/UserProvider.dart';

class TabBarWidgwtOrderScreen extends StatefulWidget {
  const TabBarWidgwtOrderScreen({key});

  @override
  State<TabBarWidgwtOrderScreen> createState() =>
      _TabBarWidgwtOrderScreenState();
}

class _TabBarWidgwtOrderScreenState extends State<TabBarWidgwtOrderScreen>
    with SingleTickerProviderStateMixin {

  Future<List<Order>> fetchOrders(userId) async {
    final response = await http.post(Uri.parse('http://prayascapital.com:5000/orders/latest'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': userId
      }),);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonOrders = jsonResponse['userOrders'];

      List<Order> orders = jsonOrders.map((e) => Order.fromJson(e)).toList();
      return orders;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userId = userProvider.user?.user_id;
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
                  child: FutureBuilder<List<Order>>(
                    future: fetchOrders(userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No Executed orders');
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final order = snapshot.data![index];
                            return ListTile(
                              title: Text(order.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        order.status == 1 ? 'Executed' : 'Pending',
                                        style: TextStyle(color: AppColors.green),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Text(
                                          order.price,
                                          style: TextStyle(color: AppColors.redShade4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          order.type,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                          decoration: BoxDecoration(
                                            color: order.order == 'buy' ? Colors.blueGrey : Colors.red,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            order.order.toUpperCase(),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
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

class Order {
  final int id;
  final String name;
  final int status;
  final String order;
  final String price;
  final int quantity;
  final String type;
  final int lots;
  final String createdAt;

  Order({
    required this.id,
    required this.name,
    required this.status,
    required this.order,
    required this.price,
    required this.quantity,
    required this.type,
    required this.lots,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        name: json['unique_name'],
        status: json['status'],
        order: json['order_method'],
        price: json['price'],
        quantity: json['quantity'],
        type: json['type'],
        lots: json['lots'],
        createdAt: json['created_at']
    );
  }
}