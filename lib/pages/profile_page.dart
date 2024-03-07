import 'package:ankit_assignment/pages/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () async {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    confirmBtnText: "Yes",
                    cancelBtnText: "No",
                    showCancelBtn: true,
                    showConfirmBtn: true,
                    title: "Are you sure you want to log out",
                    onConfirmBtnTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(() => const SplashScreen());
                    },
                    onCancelBtnTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
                child: Icon(Icons.logout)),
          )
        ],
        title: Text(
          'Logout',
          style: GoogleFonts.acme(color: Colors.white),
        ),
      ),
      body: Center(),
    );
  }
}
