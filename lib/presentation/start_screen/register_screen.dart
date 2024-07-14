import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prayas_capital/core/app_export.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/custom_outlined_button.dart';
import 'package:prayas_capital/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false; // Password visibility state

  Future<void> registerUser(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('http://prayascapital.com:5000/users/register');
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

    try {
      final responseData = json.decode(response.body);
      print(responseData); // Log the response data

      if (response.statusCode == 200) {
        // Registration successful, navigate to the next screen or handle success
        if (responseData['logged_in'] == true) {
          Navigator.pushNamed(
              context, AppRoutes.bottomNavigationBarScreenRoutesaaaaaaaa);
        } else {
          throw Exception('Unexpected response data');
        }
      } else {
        // Registration failed, handle error
        final errorMessage = 'Registration failed: ${response.statusCode}';
        print(errorMessage);

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error decoding response: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: Invalid response from server'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 20,
              top: 63,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 31),
                  child: CustomImageView(
                    imagePath: ImageConstant.appLogo,
                    height: 257,
                    width: 265,
                    radius: BorderRadius.circular(7),
                    alignment: Alignment.topCenter,
                  ),
                ),
                Text(
                  "${MyString.singUpToYour}\n ${MyString.account}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                SizedBox(height: 36),

                // Username field
                CustomTextFormField(
                  controller: usernameController,
                  hintText: 'User Name',
                ),
                SizedBox(height: 20),

                // Email field
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                SizedBox(height: 20),

                // Password field with visibility toggle
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

                // Register button
                CustomOutlinedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          registerUser(context);
                        },
                  text: isLoading ? 'Loading...' : 'Register',
                  buttonStyle: CustomButtonStyles.fillBlueGray.copyWith(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.lighterBlue),
                  ),
                ),
                SizedBox(height: 37),

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
