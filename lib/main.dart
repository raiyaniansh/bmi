import 'package:bmi/screen/home/view/home_screen.dart';
import 'package:bmi/screen/second/view/second_screen.dart';
import 'package:bmi/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => SplashScreen(),
          'home':(p0) => Homescreen(),
          'second':(p0) => SecondScreen(),
        },
      ),
    )
  );
}
