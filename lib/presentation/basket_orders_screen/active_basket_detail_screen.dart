import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/presentation/search_screen/search_screen.dart';
import '../../core/utils/ColorFile.dart';
import '../../widgets/ButtonView.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'Widget/position_history_ListView_custome.dart';

class ActiveBasketDetailsScreen extends StatefulWidget {
  ActiveBasketDetailsScreen({Key? key})
      : super(
          key: key,
        );
  @override
  State<ActiveBasketDetailsScreen> createState() =>
      _ActiveBasketDetailsScreenState();
}

class _ActiveBasketDetailsScreenState extends State<ActiveBasketDetailsScreen> {
  TextEditingController? basketNameController;
  bool isFocus = false;
  final FocusNode textFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    basketNameController = TextEditingController(text: "Done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.black,
        elevation: 10,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        //  backgroundColor: AppColors.appColor,
        title: Text(
          "Done",
          style: TextStyle(
              fontSize: 21.h,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            surfaceTintColor: AppColors.white,
                            child: Container(
                              height: 280.h,
                              width: MediaQuery.sizeOf(context).width / 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Basket Note",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextField(
                                      canRequestFocus: true,
                                      enabled: isFocus ? true : false,
                                      focusNode: textFocusNode,
                                      controller: basketNameController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    CustomOutlinedButton(
                                      onPressed: () {
                                        isFocus = true;
                                        FocusScope.of(context)
                                            .requestFocus(textFocusNode);
                                      },
                                      buttonStyle: CustomButtonStyles
                                          .outlineBlackTL8
                                          .copyWith(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        )),
                                      ),
                                      text: "Edit Note",
                                      height: 45,
                                    ),
                                    CustomOutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      buttonStyle: CustomButtonStyles
                                          .outlineBlackTL8
                                          .copyWith(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        )),
                                      ),
                                      text: "Close",
                                      height: 45,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(Icons.file_open_sharp)),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        elevation: 3,
        shape: RoundedRectangleBorder(),
        shadowColor: AppColors.white,
        backgroundColor: AppColors.white,
        onClosing: () => Navigator.pop(context),
        builder: (context) {
          return Container(
            height: 120.h,
            decoration: BoxDecoration(shape: BoxShape.rectangle,color: AppColors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) => value = value,
                    ),
                    Text("Execute Basket Order In Net Position"),
                  ],
                ),
                CustomOutlinedButton(
                  width: MediaQuery.sizeOf(context).width/1.1,
                  onPressed: () {},
                  buttonStyle: CustomButtonStyles
                      .outlineBlackTL8
                      .copyWith(
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(5),
                        )),
                  ),
                  text: "EXECUTE BASKET",
                  height: 45,
                ),
              ],
            ),
          );
        },
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 4.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 3.6,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height / 7,
                          width: MediaQuery.sizeOf(context).width / 1.1,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Required margin",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 19,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "₹ 1,41,710.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 19,
                                  ),
                                ),
                                Divider(
                                  color: AppColors.blackShade10,
                                ),
                                Text(
                                  "Hedging benefits not added!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 46.h,
                            width: MediaQuery.sizeOf(context).width / 1.1,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "ADD ORDER",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.grey,
                );
              },
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return position_history_ListView_custom(
                  context: context,
                  leftTitle: 'BUY',
                  leftTitleBackgroundColor: AppColors.green3,
                  leftTitleBorderColor: AppColors.green,
                  Avg: '0/50',
                  rightTitle: 'LIMIT',
                  rightTitleBackgroundColor: AppColors.orangeShade2,
                  rightTitleBorderColor: AppColors.orange,
                  rightTitleTextColor: AppColors.orange,
                  optionName: 'NIFTY 18750 PE',
                  date: "29-Feb-2024    04:05:37 PM",
                  ltp: "3548.15",
                  value: '3548.15',
                  exitedDatePrice: '2,737.55',
                  aboutOrder: "Pending Order",
                  cheMainTitle: true,
                  exitedAtCheck: false,
                  closedPostion: false,
                );
              },
            ),
          ),
/*
          ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColors.grey,
              );
            },
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
            return  Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.outlineBlueGray.copyWith(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                          border:
                          Border.fromBorderSide(BorderSide(color: AppColors.black)),
                          color: AppColors.darkModeColor,
                        ),
                        child: Text(
                          "Pending Order",
                          style: CustomTextStyles.titleSmallPrimary.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.outlineBlueGray.copyWith(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14),
                            bottomRight: Radius.circular(14),
                          ),
                          border:
                          Border.fromBorderSide(BorderSide(color: AppColors.black)),
                          color: AppColors.green,
                        ),
                        child: Text(
                          "Buy",
                          style: CustomTextStyles.titleSmallPrimary.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("0/50"),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.outlineBlueGray.copyWith(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                          border:
                          Border.fromBorderSide(BorderSide(color: AppColors.orange,width: 1.2),),
                          color: AppColors.orangeShade2,
                        ),
                        child: Text(
                          "MARKET",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      children: [
                        Text("NIFTY 18750 PE",style: TextStyle(
                          fontSize: 16,
                        ),),
                        Spacer(),
                        Text("0.65",style: TextStyle(
                          fontSize: 16,
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Row(
                      children: [
                        Text("29-Feb-2024",style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),),
                        SizedBox(width: 15),
                        Text("04:29:12 PM",style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 1.v,
                          ),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            border:
                            Border.fromBorderSide(BorderSide(color: AppColors.grey),),
                            color: AppColors.white,
                          ),
                          child: Text(
                            "LTP 0.65",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            );
          },),
*/
        ],
      ),
    );
  }
}
