import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/core/utils/color_constant.dart';
import 'package:todo_ash/core/utils/image_constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer when the screen is first displayed
    Timer(Duration(seconds: 2), () {
      // Navigate to the next screen after 2 seconds
      Navigator.pushReplacementNamed(context, '/new_task');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Center(
          child: Container(
            width: double.maxFinite,
            child: Image(image: AssetImage(ImageConstant.Splash)),
          ),
        ),
      ),
    );
  }
}