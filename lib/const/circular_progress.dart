import 'package:ankit_assignment/const/global_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Colors.blue,
      size: deviceWidth!*.2,
    );
  }
}
