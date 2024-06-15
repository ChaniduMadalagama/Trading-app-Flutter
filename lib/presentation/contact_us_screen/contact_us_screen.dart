import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/ButtonView.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_elevated_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController subjectEditTextController = TextEditingController();

  TextEditingController writeFeedbackEditTextController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 57.v,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        ImageConstant.imgGroup48095744,
                        height: 93.v,
                        width: 123.h,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      SizedBox(height: 23.v),
                      Text(
                        MyString.contact_Us,
                        style:
                            CustomTextStyles.titleLargeManropeOnErrorContainer,
                      ),
                      SizedBox(height: 14.v),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Text(
                          MyString.contact_Us_Description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.h),
                        ),
                      ),
                      SizedBox(height: 28.v),
                      _buildEmailEditText(context),
                      SizedBox(height: 18.v),
                      _buildSubjectEditText(context),
                      SizedBox(height: 18.v),
                      _buildWriteFeedbackEditText(context),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          //width: MediaQuery.of(context).size.width /1.5,
          child: ButtonView(
            bottomMargin: 10,
            buttonWidth: MediaQuery.of(context).size.width / 1.2,
            buttonName: MyString.Submit,
            textSize: 20,
            textColor: Theme.of(context).colorScheme.onBackground,
            buttonColor: Theme.of(context).colorScheme.onSecondary,
            onTap: () {},
            borderRadiuss: 10,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.v,
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.fromLTRB(17.h, 8.v, 349.h, 8.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: CustomTextFormField(
        controller: emailEditTextController,
        hintText: MyString.email_address,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  /// Section Widget
  Widget _buildSubjectEditText(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: CustomTextFormField(
        controller: subjectEditTextController,
        hintText: MyString.Subject,
      ),
    );
  }

  /// Section Widget
  Widget _buildWriteFeedbackEditText(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: CustomTextFormField(
        controller: writeFeedbackEditTextController,
        hintText: MyString.Write_feedback,
        hintStyle: CustomTextStyles.titleSmallGray70001,
        textInputAction: TextInputAction.done,
        maxLines: 4,
      ),
    );
  }
}
