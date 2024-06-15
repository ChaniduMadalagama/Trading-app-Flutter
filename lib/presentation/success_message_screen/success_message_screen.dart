import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 75.v,
                width: 83.h,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 76.h),
              ),
              SizedBox(height: 21.v),
              Text(
                "Great!",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 13.v),
              SizedBox(
                width: 263.h,
                child: Text(
                  "You have successfully created your Service provider app account.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMedium_1.copyWith(
                    height: 1.69,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
