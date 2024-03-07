import 'package:ankit_assignment/auth/register_with_email_password.dart';
import 'package:ankit_assignment/const/circular_progress.dart';
import 'package:ankit_assignment/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/global_data.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(
          'Registration Page',
          style: GoogleFonts.acme(
              color: Colors.white, fontSize: deviceWidth! * .08),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset("images/document.png",width: deviceWidth!*.3,),
              SizedBox(height: deviceHeight!*.08,),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    fillColor: Colors.grey,
                    filled: true,
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: deviceHeight! * .02,
              ),
              TextFormField(
                controller: confirmEmailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Re-enter Email",
                    fillColor: Colors.grey,
                    filled: true,
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: deviceHeight! * .02,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    fillColor: Colors.grey,
                    filled: true,
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: deviceHeight! * .05,
              ),
              SizedBox(
                width: deviceWidth! * .5,
                child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text != confirmEmailController.text) {
                        Fluttertoast.showToast(msg: "password not matched");
                      } else if (emailController.text.isEmpty ||
                          confirmEmailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "please enter all fields");
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const CircularProgress(),
                        );
                        registerWithEmailPassword(
                            emailController.text, passwordController.text,context);
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: Text(
                      "Registered",
                      style: GoogleFonts.acme(fontSize: deviceWidth! * .05),
                    )),
              ),
              SizedBox(
                height: deviceHeight! * .15,
              ),
              InkWell(
                onTap: () {
                  Get.to(() =>  LoginScreen());
                },
                child: Text(
                  "Back to Login screen",
                  style: GoogleFonts.acme(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
