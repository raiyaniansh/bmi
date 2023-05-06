import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0.85),
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
              ),
              Align(alignment: Alignment(0, 0.9),child: Container(height: 1.w,width: 35.w,child:   ClipRRect(borderRadius: BorderRadius.circular(20),child: LinearProgressIndicator(backgroundColor: Colors.blueGrey.shade700.withOpacity(0.30),color: Colors.blueGrey.shade700)),)),
              Align(alignment: Alignment(0, 0),child: Image.asset("assets/image/logopng.png",height: 20.h,color: Colors.blueGrey.shade700,) ,),
            ],
          ),
        ),
      ),
    );
  }
}
