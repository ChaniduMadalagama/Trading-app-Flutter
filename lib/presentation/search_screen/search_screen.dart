import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import '../../widgets/App.dart';
import '../../widgets/TextView.dart';
import '../search_screen/widgets/stockinfolist_item_widget.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/custom_search_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prayas_capital/presentation/buy_screen/buy_screen.dart';
import 'package:prayas_capital/presentation/orders_screen/place_order_screen.dart';
import '../watchlist_screen/widgets/stockinfo_item_widget.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<List<SearchListListViewWidget>> futureWatchListItems;
  List<SearchListListViewWidget> allItems = [];
  List<SearchListListViewWidget> filteredItems = [];

  @override
  void initState() {
    super.initState();
    futureWatchListItems = fetchWatchListItems();
    searchController.addListener(_filterItems);
  }

  Future<List<SearchListListViewWidget>> fetchWatchListItems() async {
    final response = await http.get(Uri.parse('http://epistlebe.tech:5000/tickers'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      allItems = jsonResponse
          .map<SearchListListViewWidget>((item) => SearchListListViewWidget(
          titleName: item['UniqueName'].toString(),
          onAddPressed: () => handleAddButton(item)))
          .toList();
      filteredItems = allItems;
      return filteredItems;
    } else {
      throw Exception('Failed to load watchlist');
    }
  }

  void handleAddButton(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('http://prayascapital.com:5000/watchlist/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Item added successfully!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add item.'),
      ));
    }
  }

  void _filterItems() {
    setState(() {
      filteredItems = allItems
          .where((item) => item.titleName.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        title: TextView(
            text: MyString.search,
            fontWeight: FontWeight.w800,
            textSize: 25,
            textColor: AppColors.white),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              height: 70,
              child: Stack(
                children: [
                  SizedBoxView(height: 30),
                  Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextField(
                            controller: searchController,
                            cursorColor: AppColors.black,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search_rounded, color: AppColors.black),
                              border: InputBorder.none,
                              hintText: MyString.search_Option,
                              hintStyle: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<SearchListListViewWidget>>(
                future: futureWatchListItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load watchlist'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No items found'));
                  } else {
                    return ListView.separated(
                      padding: EdgeInsets.all(8.0),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return filteredItems[index];
                      },
                      separatorBuilder: (context, index) => Divider(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchListListViewWidget extends StatelessWidget {
  final String titleName;
  final VoidCallback onAddPressed;

  SearchListListViewWidget({
    required this.titleName,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(titleName),
          trailing: ElevatedButton(
            onPressed: onAddPressed,
            child: Text('Add'),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
      ],
    );
  }
}
