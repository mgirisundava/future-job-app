import 'package:bwa_future_job/models/user_model.dart';
import 'package:bwa_future_job/pages/home_page.dart';
import 'package:bwa_future_job/pages/signin_page.dart';
import 'package:bwa_future_job/pages/started_page.dart';
import 'package:bwa_future_job/providers/auth_provider.dart';
import 'package:bwa_future_job/providers/user_provider.dart';
import 'package:bwa_future_job/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController goalController = TextEditingController(text: "");

  bool isUploaded = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: redColor,
      ));
    }

    Widget uploadedImage() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/upload_pic.png"),
                width: 120,
                height: 120,
              )
            ],
          ),
        ),
      );
    }

    Widget showedImage() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/showed_pic.png"),
                width: 120,
                height: 120,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, right: edge, left: edge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Begin New Journey",
                  style: subTitleTextStyle,
                ),
                SizedBox(
                  height: 50,
                ),
                isUploaded ? showedImage() : uploadedImage(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Full Name",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {});
                  },
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
                  style: TextStyle(color: deepBlueColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Email Address",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {});
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
                                  EmailValidator.validate(emailController.text)
                                      ? deepBlueColor
                                      : redColor)),
                      hintText: ""),
                  style: TextStyle(
                      color: EmailValidator.validate(emailController.text)
                          ? deepBlueColor
                          : redColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 20,
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
                  style: TextStyle(color: deepBlueColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Goal",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: goalController,
                  onChanged: (value) {
                    setState(() {});
                  },
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
                  style: TextStyle(color: deepBlueColor),
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
                                passwordController.text.isEmpty ||
                                nameController.text.isEmpty ||
                                goalController.text.isEmpty) {
                              showError("Semua fields harus diisi");
                            } else {
                              setState(() {
                                isLoading = true;
                              });

                              UserModel? user = await authProvider.register(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                  goalController.text);

                              setState(() {
                                isLoading = false;
                              });

                              if (user == null) {
                                showError("Email sudah terpakai");
                              } else {
                                userProvider.user = user;
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/home", (route) => false);
                              }
                            }
                          },
                          child: Text(
                            "Sign Up",
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
                              builder: (context) => StartedPage()));
                    },
                    child: Text(
                      "Back to Home",
                      style: GoogleFonts.poppins(
                          color: greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
