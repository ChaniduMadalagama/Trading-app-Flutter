import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/custom_elevated_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class WalkthroughFortyoneScreen extends StatelessWidget {
  WalkthroughFortyoneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                padding: EdgeInsets.only(
                  left: 9.h,
                  top: 65.v,
                  right: 9.h,
                ),
                child: Column(
                  children: [
                    Text(
                      "Create an account",
                      style: CustomTextStyles.headlineSmallManropeOnPrimary,
                    ),
                    SizedBox(height: 97.v),
                    _buildFirstName(context),
                    SizedBox(height: 16.v),
                    _buildLastName(context),
                    SizedBox(height: 16.v),
                    _buildMobileNo(context),
                    SizedBox(height: 16.v),
                    _buildEmail(context),
                    SizedBox(height: 16.v),
                    _buildPassword(context),
                    SizedBox(height: 39.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By creating this account, you agree to our",
                            style: CustomTextStyles.labelLargeff4e4e4e,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: CustomTextStyles.titleSmallff4e4e4e15,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 56.v),
                    _buildCreateAccountButton(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 8.h,
      ),
      child: CustomTextFormField(
        controller: firstNameController,
        hintText: "First Name",
      ),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 8.h,
      ),
      child: CustomTextFormField(
        controller: lastNameController,
        hintText: "Last Name",
      ),
    );
  }

  /// Section Widget
  Widget _buildMobileNo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 6.h,
      ),
      child: CustomTextFormField(
        controller: mobileNoController,
        hintText: "+91 8999534948",
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 8.h,
      ),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email *",
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 8.h,
      ),
      child: CustomTextFormField(
        controller: passwordController,
        hintText: "Password *",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
    return CustomElevatedButton(
      height: 46.v,
      text: "Create an Account",
      margin: EdgeInsets.symmetric(horizontal: 11.h),
    );
  }
}
