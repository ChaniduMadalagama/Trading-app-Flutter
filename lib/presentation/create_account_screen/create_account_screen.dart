import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_checkbox_button.dart';
import 'package:prayas_capital/widgets/custom_elevated_button.dart';
import 'package:prayas_capital/widgets/custom_floating_text_field.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController floatingTextFieldController = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  TextEditingController editTextController2 = TextEditingController();

  TextEditingController editTextController3 = TextEditingController();

  bool checkBox = false;

  bool checkBox1 = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
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
                  vertical: 8.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: CustomTextStyles.titleLargeManropeOnErrorContainer,
                    ),
                    SizedBox(height: 12.v),
                    Text(
                      "Let’s create Shopeasy account",
                      style: CustomTextStyles.titleMediumBluegray700,
                    ),
                    SizedBox(height: 33.v),
                    _buildFirstName(context),
                    SizedBox(height: 20.v),
                    _buildEditText1(context),
                    SizedBox(height: 20.v),
                    _buildEditText2(context),
                    SizedBox(height: 20.v),
                    _buildEditText3(context),
                    SizedBox(height: 21.v),
                    _buildCheckBox(context),
                    SizedBox(height: 13.v),
                    _buildCheckBox1(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildButton(context),
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
        margin: EdgeInsets.fromLTRB(16.h, 8.v, 350.h, 7.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingTextField(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: CustomFloatingTextField(
          controller: floatingTextFieldController,
          labelText: "First Name",
          labelStyle: CustomTextStyles.titleMediumOnErrorContainer,
          hintText: "First Name",
          contentPadding: EdgeInsets.fromLTRB(20.h, 16.v, 20.h, 15.v),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.h,
          top: 11.v,
        ),
        child: CustomTextFormField(
          controller: editTextController,
          hintText: "Last Name",
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildFloatingTextField(context),
        _buildEditText(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildEditText1(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController1,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildEditText2(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController2,
      hintText: "Phone Number",
      textInputType: TextInputType.phone,
    );
  }

  /// Section Widget
  Widget _buildEditText3(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController3,
      hintText: "Address",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildCheckBox(BuildContext context) {
    return CustomCheckboxButton(
      text: "Agree with Terms & Condition.",
      value: checkBox,
      onChange: (value) {
        checkBox = value;
      },
    );
  }

  /// Section Widget
  Widget _buildCheckBox1(BuildContext context) {
    return CustomCheckboxButton(
      text: "Agree with Privacy Policy.",
      value: checkBox1,
      textStyle: CustomTextStyles.bodyMediumSFProDisplaySecondaryContainer,
      onChange: (value) {
        checkBox1 = value;
      },
    );
  }

  /// Section Widget
  Widget _buildButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Sign Up",
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 57.v,
      ),
    );
  }
}
