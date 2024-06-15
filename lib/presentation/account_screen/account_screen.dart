import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/App.dart';
import 'package:prayas_capital/widgets/TextView.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../Controller/app_theme/ThemeModel.dart';
import '../../core/utils/ColorFile.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController fundsController = TextEditingController();

  TextEditingController resetFundsController = TextEditingController();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.light_mode,
          color: AppColors.white,
        );
      }
      return const Icon(
        Icons.nightlight,
        color: AppColors.white,
      );
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final profileProvider = Provider.of<ThemeModel>(context, listen: false);
    profileProvider.getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final themeModelProvider = Provider.of<ThemeModel>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 5.v),
            child: Column(
              children: [
                _buildHelloSection(context),
                SizedBox(height: 20.v),
                _buildFundsSection(context),
                SizedBox(height: 6.v),
                Container(
                  height: 10.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: appTheme.gray20001,
                  ),
                ),
                SizedBox(height: 20.v),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCategory(
                        context: context,
                        imagePath: ImageConstant.serviceIcon,
                        name: MyString.services,
                        imageType: 'png',
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.moreScreen);
                        },
                      ),
                      SizedBox(height: 10.v),

                      _buildCategory(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.contactUsScreen);
                        },
                        context: context,
                        imagePath: ImageConstant.imgFrameOnerrorcontainer,
                        name: MyString.contactUs,
                        imageType: 'svg',
                      ),
                      // SizedBox(height: 31.v),
                      SizedBox(height: 10.v),
                      _buildCategory(
                        context: context,
                        imagePath: ImageConstant.imgFrame,
                        name: MyString.resetAppData,
                        imageType: 'svg',
                        onTap: () {},
                      ),
                      SizedBox(height: 10.v),

                      _buildCategory(
                        context: context,
                        imagePath: ImageConstant.imgAddFriend241,
                        name: MyString.inviteFriends,
                        imageType: 'png',
                        onTap: () {},
                      ),
                      // SizedBox(height: 10.v),
/*
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBoxView(width: 15),
                              CustomImageView(
                                imagePath: ImageConstant.themeIcon,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: EdgeInsets.only(bottom: 2.v),
                              ),
                              SizedBoxView(width: 20),
                              TextView(
                                text: MyString.theme,
                              ),
                               Spacer(),
                              Consumer<ThemeModel>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Switch(
                                    thumbIcon: thumbIcon,
                                    inactiveThumbColor: AppColors.black,
                                    value: value.checkThemeShared,
                                    activeColor: AppColors.appColor,
                                    onChanged: (bool value) {
                                      themeModelProvider.setAppTheme(value);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
*/
                      SizedBox(height: 10.v),
                      _buildCategory(
                        context: context,
                        imagePath: ImageConstant.imgFrameOnerrorcontainer24x24,
                        name: MyString.logout,
                        imageType: 'png',
                        onTap: () {},
                      ),
                      SizedBox(height: 50.v),
                      Text(
                        MyString.join_Our_Community,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.h),
                      ),
                      SizedBox(height: 6.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.img1658587303instagramPng,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            margin: EdgeInsets.only(
                              top: 5.v,
                              bottom: 4.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgLogoTwitterPng5859,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            margin: EdgeInsets.only(
                              left: 15.h,
                              top: 2.v,
                              bottom: 1.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgTelegramLogoT,
                            height: 27.v,
                            width: 30.h,
                            margin: EdgeInsets.only(left: 10.h),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgIcons8Facebook48,
                            height: 20.v,
                            width: 21.h,
                            margin: EdgeInsets.only(
                              left: 15.h,
                              top: 4.v,
                              bottom: 3.v,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //    bottomNavigationBar: _buildMoreSection(context),
    );
  }

  /// Section Widget
  Widget _buildHelloSection(BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 42.h,
        vertical: 20.v,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            MyString.hello,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17.h,
            ),
          ),
          //SizedBox(height: 8.v),
          Consumer<ThemeModel>(
            builder: (BuildContext context, value, Widget? child) {
              print(">>>>>>>>>>>>>>>>>>>>>>>>>${value.profile_name}");
              return Text(
                 value.profile_name == null ? "" : value.profile_name.toString(),
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28.h,
                    fontWeight: FontWeight.w900),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFundsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomOutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: SingleChildScrollView(
                              child: Dialog(
                                surfaceTintColor: AppColors.white,
                                child: Container(
                                  // height: 220,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          MyString.set_Fund,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                        ),
                                        CustomTextFormField(
                                          autofocus: false,
                                          borderDecoration: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          prefix: Icon(
                                              Icons.monetization_on_outlined),
                                          hintText: "Enter Amount",
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                        SizedBoxView(height: 10),
                                        CustomOutlinedButton(
                                          buttonStyle:
                                              CustomButtonStyles.outlineBlackTL8,
                                          text: "Confirm",
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
                    text: "Set Fund",
                    buttonStyle: CustomButtonStyles.outlineBlackTL8,
                    buttonTextStyle: TextStyle(
                        fontSize: 18.h,
                        color: Theme.of(context).colorScheme.onPrimary),
                    height: 70.h,
                  ),
                  Container(
                    //  width: 117.h,
                    margin: EdgeInsets.only(left: 7.h),
                    child: Text(
                      "Available fund\n₹ 10,00,000.00",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 17.h,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomOutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            surfaceTintColor: Colors.white,
                            title: Row(
                              children: [
                                Icon(Icons.refresh),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.v),
                                  child: Text(
                                    'Reset Fund to ₹1,00,000.00',
                                    style:
                                        CustomTextStyles.titleMediumBluegray700,
                                  ),
                                ),
                              ],
                            ),
                            content: const Text('Are you sure?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: "Reset Fund",
                    buttonStyle: CustomButtonStyles.outlineBlackTL8,
                    buttonTextStyle: TextStyle(
                        fontSize: 18.h,
                        overflow: TextOverflow.clip,
                        color: Theme.of(context).colorScheme.onPrimary),
                    height: 70.h,
                  ),
                  Container(
                    //width: 96.h,
                    margin: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "Used Margin\n₹ 320.50",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 17.h,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory({
    required BuildContext context,
    required String imageType,
    required String imagePath,
    required String name,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBoxView(width: 15),
              imageType == 'png'
                  ? CustomImageView(
                      imagePath: imagePath,
                      color: Theme.of(context).colorScheme.onSecondary,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(bottom: 2.v),
                    )
                  : SvgPicture.asset(
                      imagePath,
                      color: Theme.of(context).colorScheme.onSecondary,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
              SizedBoxView(width: 20),
              TextView(
                text: name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
