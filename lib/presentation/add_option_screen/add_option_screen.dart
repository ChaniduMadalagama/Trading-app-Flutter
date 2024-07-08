import 'package:flutter/material.dart';
import 'package:prayas_capital/Controller/app_theme/ThemeModel.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/presentation/nifty50_banknifty_widget.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';

class AddOptionScreen extends StatefulWidget {
  AddOptionScreen();

  @override
  State<AddOptionScreen> createState() => _AddOptionScreenState();
}

class _AddOptionScreenState extends State<AddOptionScreen> {
  var index = [
    'NIFTY',
    'BANKNIFTY',
  ];
  var expiry = [
    'expiry 1',
    'expiry 2',
    'expiry 3',
    'expiry 4',
    'expiry 5',
  ];
  var optionType = [
    'CE',
    'PE',
  ];
  var stokePrice = [
    'stokePrice 1',
    'stokePrice 2',
    'stokePrice 3',
    'stokePrice 4',
    'stokePrice 5',
  ];

  String indexLabel = 'NIFTY';
  //String? expiryLabel;
  String optionTypeLabel = 'CE';
  String stokePriceLabel = 'stokePrice 1';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final addOptionController = Provider.of<ThemeModel>(context, listen: false);
    addOptionController.getNiftyExpiryDetails(optionType: 'Nifty');
  }

  @override
  Widget build(BuildContext context) {

    final addOptionController1 = Provider.of<ThemeModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        title: TextView(text: MyString.add_Option, textColor: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 10.h, left: 10.h),
          child: Column(
            children: [
              // niftyAndBankNiftyWidget(),
              SizedBoxView(
                height: 30.v,
              ),
              TextView(
                  text: MyString.add_option_to_watchlist,
                  fontWeight: FontWeight.w800,
                  textSize: 25),
              SizedBoxView(
                height: 10.v,
              ),
              Divider(
                color: AppColors.black,
              ),
              SizedBoxView(
                height: 20.v,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(text: MyString.index),
                        Container(
                          height: 50.v,
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: DropdownButton(
                            value: indexLabel,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            items: index.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                indexLabel = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBoxView(width: 20),

                    /// >>>> Expiry
                    Consumer<ThemeModel>(
                      builder: (context, value, child) {
                        return  value.niftyExpiryDataList!.length == 0 ? Text("data") :  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(text: MyString.expiry),
                            Container(
                              height: 50.v,
                              width: MediaQuery.of(context).size.width / 2.8,
                              child: DropdownButton(
                                value: value.expiryLabel,
                                isExpanded: true,
                                elevation: 0,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                ),
                                // Array list of items
                                items: value.niftyExpiryDataList!
                                    .map((expiryDate) {
                                  return DropdownMenuItem(
                                    value: expiryDate.endDate.toString(),
                                    child: Text(expiryDate.endDate.toString()),
                                  );
                                }).toList(),
                                onChanged: (newValue) {

                                  addOptionController1.getExpiryDateInDropdown(date: newValue.toString());


                                },
                              ),
                            ),
                          ],
                        );
                      },
                      /*   child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(text: MyString.expiry),
                          Container(
                            height: 50.v,
                            width: MediaQuery.of(context).size.width / 2.8,
                            child: DropdownButton(
                              value: expiryLabel,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              items: expiry.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  expiryLabel = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),*/
                    ),
                  ],
                ),
              ),
              SizedBoxView(
                height: 20.v,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextView(
                    text: MyString.option_type,
                    fontWeight: FontWeight.w300,
                  )),
              Container(
                height: 50.v,
                width: MediaQuery.of(context).size.width / 1.2,
                child: DropdownButton(
                  value: optionTypeLabel,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: optionType.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      optionTypeLabel = newValue!;
                    });
                  },
                ),
              ),
              SizedBoxView(height: 20.v),
              Container(
                height: 50.v,
                width: MediaQuery.of(context).size.width / 1.2,
                child: DropdownButton(
                  value: stokePriceLabel,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: stokePrice.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      stokePriceLabel = newValue!;
                    });
                  },
                ),
              ),
              SizedBoxView(height: 20.v),
              Container(
                height: 50.v,
                width: MediaQuery.of(context).size.width / 1.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: TextView(text: MyString.add_to_watchlist),
              ),
              Form(
                child: TextFormField(
                  //controller: _controller,
                  decoration:
                      InputDecoration(labelText: MyString.send_a_message),
                ),
              ),
              SizedBoxView(height: 500),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        //width: MediaQuery.of(context).size.width / 1.2,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: SwipeButton.expand(
          duration: const Duration(milliseconds: 200),
          thumb: Icon(
            Icons.double_arrow_rounded,
            color: Theme.of(context).colorScheme.background,
          ),
          //  activeThumbColor: AppColors.black,
          activeThumbColor: Theme.of(context).colorScheme.onSecondary,
          activeTrackColor: Theme.of(context).colorScheme.surface,
          //activeTrackColor: Colors.grey.shade300,
          onSwipe: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: TextView(
                  text: "Swipe to order",
                  //    textColor: Theme.of(context).colorScheme.onSecondary,
                  textColor: AppColors.black,
                ),
                //backgroundColor: Colors.green,
              ),
            );
          },
          child: TextView(
            text: "Swipe to order",
            textColor: AppColors.black,
          ),
        ),
      ),
    );
  }
}
