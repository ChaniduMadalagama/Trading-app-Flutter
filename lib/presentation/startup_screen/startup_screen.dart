import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/widgets/custom_icon_button.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgUntitled11,
                height: 844.v,
                width: 389.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 93.h,
                    vertical: 264.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 25.h),
                        child: CustomIconButton(
                          height: 62.adaptSize,
                          width: 62.adaptSize,
                          padding: EdgeInsets.all(10.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgCart,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        "Ballina’s Veg Shop",
                        style: CustomTextStyles.labelLargeSFProTextWhiteA700,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
