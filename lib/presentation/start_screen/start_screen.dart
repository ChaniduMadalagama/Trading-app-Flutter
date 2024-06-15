import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/SharedPreferences/SharedPreferences.dart';
import 'package:prayas_capital/auth/google_signIn.dart';
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../Controller/app_theme/ThemeModel.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController createaccountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ThemeModel>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 20.h,
            top: 63.v,
            right: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                /*height: 307.v,
                width: 265.h,*/
                margin: EdgeInsets.only(right: 31.h),
                child: CustomImageView(
                  imagePath: ImageConstant.appLogo,
                  height: 257.v,
                  width: 265.h,
                  radius: BorderRadius.circular(
                    7.h,
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
              Text(
                "${MyString.singInToYour}\n ${MyString.account}",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.h),
              ),
              SizedBox(height: 36.v),
              CustomOutlinedButton(
                onPressed: () {
                  Authentication.signInWithGoogle(loginProvider, context);
                },
                buttonStyle: CustomButtonStyles.fillBlueGray.copyWith(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.lighterBlue)),
                leftIcon: SizedBox(
                    //  width: 28.adaptSize,
                    width: MediaQuery.of(context).size.width / 10,
                    child: Image.asset(
                      ImageConstant.imgPngGoogleLogo,
                      height: 28.h,
                    )),
                text: MyString.continueWithGoogle,
              ),
              SizedBox(height: 16.v),
              CustomOutlinedButton(
                buttonStyle: CustomButtonStyles.fillBlueGray.copyWith(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.lighterBlue)),
                leftIcon: SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                    child: Image.asset(
                      ImageConstant.imgPngAppleLogo,
                      height: 25.h,
                    )),
                text: MyString.singUpWithApple,
              ),
              SizedBox(height: 37.v),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
               //   print("userEmail >>>> $userEmail");
                  loginProvider.loginUser(userEmail: "gest@gmail.com",name: "", id: "", token: "", context: context);
           /*       Navigator.pushNamed(context,
                      AppRoutes.bottomNavigationBarScreenRoutesaaaaaaaa);*/
                  //   value.toggleMode();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  //  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    MyString.checkoutAsGuest,
                    style:
                        TextStyle(fontSize: 18.h, fontWeight: FontWeight.w600),
                  ),
                ),

                //  child:
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
