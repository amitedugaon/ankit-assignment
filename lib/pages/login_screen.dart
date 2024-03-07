import 'package:ankit_assignment/auth/login_with_email_and_password.dart';
import 'package:ankit_assignment/const/circular_progress.dart';
import 'package:ankit_assignment/const/global_data.dart';
import 'package:ankit_assignment/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        backgroundColor: Colors.black87,
        title: Text(
          'Login Page',
          style: GoogleFonts.acme(
              color: Colors.white, fontSize: deviceWidth! * .08),
        ),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  filled: true,
                  hintText: "ankit@gmail.com"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';

                }
                return null;
              },
              onSaved: (value) {
                _email = value!.trim();
              },
            ),
            SizedBox(height: deviceHeight! * .025),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  filled: true,
                  hintText: "***********"),
              validator: (value) {
                return null;
              },
              onSaved: (value) {
                _email = value!.trim();
              },
            ),
            SizedBox(height: deviceHeight! * .05),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(deviceWidth! * .01),
                  ))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context) => const CircularProgress(),);
                  loginWithEmailPassword(
                      emailController.text, passwordController.text,context);
                }
              },
              child: Text(
                'Login',
                style: GoogleFonts.acme(fontSize: deviceWidth! * .05),
              ),
            ),
            SizedBox(height: deviceHeight! * .05),
            TextButton(
                onPressed: () {
                  Get.to(() => const RegistrationPage(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(microseconds: 500));
                },
                child: Text("Create a new account ? Click ",
                    style: GoogleFonts.acme(
                        color: Colors.white, fontSize: deviceWidth! * .05)))
          ],
        ),
      ),
    );
  }
}
