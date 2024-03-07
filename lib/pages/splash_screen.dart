import 'package:animate_do/animate_do.dart';
import 'package:ankit_assignment/const/global_data.dart';
import 'package:ankit_assignment/pages/home_screen.dart';
import 'package:ankit_assignment/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  navigateToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        String? auth = FirebaseAuth.instance.currentUser?.uid;
        if (auth != null) {
          Get.offAll(() => const HomeScreen());
        } else {
          Get.offAll(() =>  LoginScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeInDown(
          child: Text(
            "News App",
            style: GoogleFonts.acme(
                color: Colors.white, fontSize: deviceWidth! * .1),
          ),
        ),
      ),
    );
  }
}
