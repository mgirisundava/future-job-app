import 'package:bwa_future_job/models/user_model.dart';
import 'package:bwa_future_job/pages/home_page.dart';
import 'package:bwa_future_job/pages/signup_page.dart';
import 'package:bwa_future_job/providers/auth_provider.dart';
import 'package:bwa_future_job/providers/user_provider.dart';
import 'package:bwa_future_job/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: redColor,
    ));
  }

  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, right: edge, left: edge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Build Your Career",
                  style: subTitleTextStyle,
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image(
                    image: AssetImage("assets/images/illustration_one.png"),
                    width: 261.49,
                    height: 240,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//TODO = INPUT EMAIL
                    Text(
                      "Email Address",
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        print(value);
                        bool isValid = EmailValidator.validate(value);
                        print(isValid);
                        if (isValid) {
                          setState(() {
                            isEmailValid = true;
                          });
                        } else {
                          setState(() {
                            isEmailValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: lightGreyColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color:
                                      isEmailValid ? deepBlueColor : redColor)),
                          hintText: " "),
                      style: TextStyle(
                          color: isEmailValid ? deepBlueColor : redColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//TODO = INPUT PASSWORD
                    Text(
                      "Password",
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passwordController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: lightGreyColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(color: deepBlueColor)),
                          hintText: ""),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 50,
                      width: 400,
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: deepBlueColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(66))),
                              onPressed: () async {
                                if (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  showError("Semua fields harus diisi");
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  UserModel? user = await authProvider.login(
                                    emailController.text,
                                    passwordController.text,
                                  );

                                  setState(() {
                                    isLoading = false;
                                  });

                                  if (user == null) {
                                    showError("Email atau password salah");
                                  } else {
                                    userProvider.user = user;
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "/home", (route) => false);
                                  }
                                }
                              },
                              child: Text(
                                "Sign In",
                                style: buttonTextStyle,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          "Create New Account",
                          style: GoogleFonts.poppins(
                              color: greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
