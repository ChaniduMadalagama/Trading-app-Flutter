import '../phone_verification_screen/widgets/phoneverification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayas_capital/widgets/app_bar/custom_app_bar.dart';
import 'package:prayas_capital/widgets/custom_elevated_button.dart';
import 'package:prayas_capital/widgets/custom_pin_code_text_field.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 48.v),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup44469,
                  height: 90.v,
                  width: 118.h,
                ),
                SizedBox(height: 31.v),
                Text(
                  "Phone Verification",
                  style: CustomTextStyles.titleLargeManropeOnErrorContainer,
                ),
                SizedBox(height: 10.v),
                SizedBox(
                  width: 247.h,
                  child: Text(
                    "The verification code was sent to\n+00 123 123 1234",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumBluegray700.copyWith(
                      height: 1.69,
                    ),
                  ),
                ),
                SizedBox(height: 34.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 66.h),
                  child: CustomPinCodeTextField(
                    context: context,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 22.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn’t get it?",
                        style: CustomTextStyles.titleMediumff01031c,
                      ),
                      TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "Resend",
                        style: CustomTextStyles.titleMediumffff7a00,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 58.v),
                CustomElevatedButton(
                  text: "Verify",
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                ),
                SizedBox(height: 34.v),
                _buildPhoneVerificationKeyboardLight(context),
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
      height: 40.v,
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.fromLTRB(16.h, 8.v, 350.h, 7.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneVerificationKeyboardLight(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.fillBlueGrayB,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 47.v,
                crossAxisCount: 3,
                mainAxisSpacing: 6.h,
                crossAxisSpacing: 6.h,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (context, index) {
                return PhoneverificationItemWidget();
              },
            ),
          ),
          SizedBox(height: 7.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 43.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomElevatedButton(
                    height: 46.v,
                    width: 122.h,
                    text: "0",
                    buttonStyle: CustomButtonStyles.outlineBlackTL5,
                    buttonTextStyle: theme.textTheme.headlineSmall!,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgDelete,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    margin: EdgeInsets.only(
                      left: 54.h,
                      top: 6.v,
                      bottom: 8.v,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 41.v),
        ],
      ),
    );
  }
}
