import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/orders_screen/place_order_screen.dart';
import 'widgets/WatchListListViewWidget.dart';
import 'dart:developer';

class WatchlistScreen extends StatefulWidget {
  WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<List<WatchListListViewWidget>> futureWatchListItems;
  final WebSocketChannel channel =
  IOWebSocketChannel.connect('ws://prayascapital.com:4000');

  @override
  void initState() {
    super.initState();
    futureWatchListItems = fetchWatchListItems();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  Future<List<WatchListListViewWidget>> fetchWatchListItems() async {
    try {
      final response = await http.post(
        Uri.parse('http://prayascapital.com:5000/watchlist/latest'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'user_id': 1}),
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map<WatchListListViewWidget>((item) => WatchListListViewWidget.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load watchlist');
      }
    } catch (e) {
      throw Exception('Failed to load watchlist: $e');
    }
  }

  Future<void> _refreshWatchList() async {
    setState(() {
      futureWatchListItems = fetchWatchListItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              child: Text(
                'Live data of your watchlist',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshWatchList,
                child: FutureBuilder<List<WatchListListViewWidget>>(
                  future: futureWatchListItems,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data found'));
                    } else {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: PlaceOrderScreen(
                                    titleName: item.titleName,
                                    subTitleName: item.subTitleName,
                                    high: item.high,
                                    low: item.low,
                                    percentage: item.percentage,
                                    price: item.price,
                                    exchange: item.exchange,
                                    lastTradeTime: item.lastTradeTime,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 0.5,
                                  width: double.infinity,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                                item,
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class WatchListListViewWidget extends StatelessWidget {
  final String titleName;
  final String subTitleName;
  final String price;
  final String percentage;
  final String high;
  final String low;
  final String exchange;
  final String lastTradeTime;

  WatchListListViewWidget({
    required this.titleName,
    required this.subTitleName,
    required this.price,
    required this.percentage,
    required this.high,
    required this.low,
    required this.exchange,
    required this.lastTradeTime,
  });

  factory WatchListListViewWidget.fromJson(Map<String, dynamic> json) {
    return WatchListListViewWidget(
      titleName: json['UniqueName'].toString(),
      subTitleName: json['Symbol'].toString(),
      price: json['Open'].toString(),
      percentage: json['BBP'].toString(),
      high: json['High'].toString(),
      low: json['Low'].toString(),
      exchange: json['Exchange'].toString(),
      lastTradeTime: json['LastTradedTime'].toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleName, style:TextStyle(fontSize: 12)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Low: $low',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'High: $high',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(exchange),
          Text(lastTradeTime),
        ],
      ),
    );
  }
}
