import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/presentation/orders_screen/place_order_screen.dart';
import 'widgets/WatchListListViewWidget.dart';
import 'package:provider/provider.dart';
import 'package:prayas_capital/auth/UserProvider.dart';

class WatchlistScreen extends StatefulWidget {
  WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<List<WatchListListViewWidget>> futureWatchListItems;
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://prayascapital.com:4000');

  void onDataReceived(data) async{
    print(data);
    List<WatchListListViewWidget> list = await futureWatchListItems;
    for(var item in list){
      // if(item['unique_name'] == data)
    }
  }

  @override
  void initState() {
    super.initState();
    futureWatchListItems = fetchWatchListItems(context);
    channel.stream.listen((data) {
      onDataReceived(data);
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  Future<List<WatchListListViewWidget>> fetchWatchListItems(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userId = userProvider.user?.user_id;

    if (userId == null) {
      throw Exception('User ID is null');
    }

    try {
      final response = await http.post(
        Uri.parse('http://prayascapital.com:5000/watchlist/latest'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'user_id': userId}),
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map<WatchListListViewWidget>((item) => WatchListListViewWidget.fromJson(item))
            .toList();
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  Future<void> _refreshWatchList() async {
    setState(() {
      futureWatchListItems = fetchWatchListItems(context);
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
  final String change;
  final String changeMark;

  WatchListListViewWidget({
    required this.titleName,
    required this.subTitleName,
    required this.price,
    required this.percentage,
    required this.high,
    required this.low,
    required this.exchange,
    required this.lastTradeTime,
    required this.change,
    required this.changeMark
  });

  factory WatchListListViewWidget.fromJson(Map<String, dynamic> json) {
    return WatchListListViewWidget(
      titleName: json['DisplayName'].toString(),
      subTitleName: json['Symbol'].toString(),
      price: json['LTP'].toString(),
      percentage: json['BBP'].toString(),
      high: json['High'].toString(),
      low: json['Low'].toString(),
      exchange: json['Exchange'].toString(),
      lastTradeTime: json['LastTradedTime'].toString(),
      change: json['Change'],
      changeMark: json['ChangeMark'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                  child: Text(
                    '$subTitleName',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: Text('$lastTradeTime (LTT)', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$price',
            style: TextStyle(
              fontSize: 16.0,
              color: changeMark == '-' ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$change',
            style: TextStyle(
              fontSize: 16.0,
              color: changeMark == '-' ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
