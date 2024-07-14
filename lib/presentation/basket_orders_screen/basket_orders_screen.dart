import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_title.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_elevated_button.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';
import '../../widgets/ButtonView.dart';

class BasketOrdersScreen extends StatefulWidget {
  BasketOrdersScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<BasketOrdersScreen> createState() => _BasketOrdersScreenState();
}

class _BasketOrdersScreenState extends State<BasketOrdersScreen> {
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //   appBar: _buildAppBar(context),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          //   backgroundColor: AppColors.appColor,
          title: Text(
            "Basket Orders",
            style: TextStyle(
                fontSize: 21.h,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 18.v),
            child: Column(
              children: [
                /* Container(
                    padding: EdgeInsets.only(left: 20,bottom: 22,),
                    width: double.infinity,
                    child: Text("Basket Orders",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),)),
*/

                /*  CustomElevatedButton(
                  height: 42.v,
                  width: 201.h,
                  text: "Create New Basket",
                  buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                  buttonTextStyle: theme.textTheme.titleSmall!,
                ),*/
                /*   Container(
                  alignment: Alignment.center,
                  height: 42.v,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text('Create New Basket'),
                ),*/
                SizedBox(height: 19.v),
                Divider(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                SizedBox(height: 19.v),
                _buildActiveRow(context),
                SizedBox(height: 65.v),
                _buildNameColumn(context),
                SizedBox(height: 80.v),
                /*CustomImageView(
                  imagePath: ImageConstant.imgImage3,
                  height: 302.v,
                  width: 390.h,
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Basket Orders",
        margin: EdgeInsets.only(left: 18.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildActiveRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 23.h,
        right: 17.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Active",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            "Closed",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameColumn(BuildContext context) {
    return Container(
      width: 350.h,
      margin: EdgeInsets.only(
        left: 23.h,
        right: 17.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create New Basket ",
            // style: CustomTextStyles.titleSmallGray70001,
          ),
          SizedBox(height: 14.v),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.black900.withOpacity(0.12),
                width: 1.h,
              ),
              borderRadius: BorderRadiusStyle.roundedBorder7,
            ),
            child: Container(
              height: 54.v,
              width: 312.h,
              decoration: AppDecoration.outlineBlack9001.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder7,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondary)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomTextFormField(
                    width: 312.h,
                    controller: nameController,
                    hintText: "Enter  Basket Name",
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary,),
                    textInputAction: TextInputAction.done,
                    alignment: Alignment.center,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(14.h, 13.v, 10.h, 13.v),
                      child: SvgPicture.asset(ImageConstant.imgPngBasketSvg,
                      height: 22.v,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 54.v,
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 16.v,
                      right: 12.h,
                      bottom: 16.v,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 35.v),
       /*   Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //set border radius more than 50% of height and width to make circle
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.basketOrdersScreen);
              },
              child: Container(
                alignment: Alignment.center,
                height: 42.v,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: AppColors.appColor1,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Create',
                  style: TextStyle(color: AppColors.white, fontSize: 15.h),
                ),
              ),
            ),
          ),*/
          ButtonView(
            bottomMargin: 10,
            buttonWidth: MediaQuery.of(context).size.width / 1.5,
            buttonHeight: 42.v,
            buttonName: 'Create',
            textSize: 15.h,
            textColor: Theme.of(context).colorScheme.onBackground,
            buttonColor: Theme.of(context).colorScheme.onSecondary,
            onTap: () {

            },
            borderRadiuss: 5,
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
