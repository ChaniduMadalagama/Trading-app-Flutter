import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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

  Future<List<Order>> fetchOrders() async {
    final response = await http.post(Uri.parse('http://prayascapital.com:5000/orders/latest'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode({
        'user_id': 1
      }),);

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Order.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

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
                  child: FutureBuilder<List<Order>>(
                    future: fetchOrders(),
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
                                      SizedBox(width: 8),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Text(
                                          order.price,
                                          style: TextStyle(color: AppColors.redShade4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Additional content row within the ListTile
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.fromLTRB(6, 3, 6, 3), // Adjust padding as needed
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(4), // Optional: adds rounded corners
                                        ),
                                        child: Text(
                                          order.type,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(left: 16),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.fromLTRB(6, 3, 6, 3), // Adjust padding as needed
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(4), // Optional: adds rounded corners
                                        ),
                                        child: Text(
                                          order.order.toUpperCase(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),)

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
