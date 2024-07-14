import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';
import 'package:prayas_capital/auth/UserProvider.dart';
import 'package:prayas_capital/auth/user_model.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;

  Future<void> loginUser(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('http://prayascapital.com:5000/users/login');
    final response = await http.post(
      url,
      body: json.encode({
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['logged_in'] == true) {
        final user = UserModel.fromJson({
          'username': responseData['username'],
          'email': responseData['email'],
          'user_id': responseData['id']
        });
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        Navigator.pushNamed(
            context, AppRoutes.bottomNavigationBarScreenRoutesaaaaaaaa);
      } else {
        print(responseData);
      }
    } else {
      final errorMessage = 'Login failed: ${response.statusCode}';
      print(errorMessage);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 63),
                Container(
                  margin: EdgeInsets.only(right: 31),
                  child: CustomImageView(
                    imagePath: ImageConstant.appLogo,
                    height: 257,
                    width: 265,
                    radius: BorderRadius.circular(7),
                  ),
                ),
                Text(
                  "${MyString.LoginInToYour}\n${MyString.account}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                SizedBox(height: 36),
                CustomTextFormField(
                  controller: usernameController,
                  hintText: 'User Name',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: !isPasswordVisible,
                  suffix: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          loginUser(context);
                        },
                  text: isLoading ? 'Loading...' : 'Login',
                  buttonStyle: CustomButtonStyles.fillBlueGray.copyWith(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.lighterBlue),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'You don\'t have an account? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign up Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the sign-up action here
                            print('Sign up Now tapped');
                            Navigator.pushNamed(
                                context, AppRoutes.registerScreen);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.pushNamed(context,
                        AppRoutes.bottomNavigationBarScreenRoutesaaaaaaaa);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      MyString.checkoutAsGuest,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
