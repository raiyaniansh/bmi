import 'dart:math';

import 'package:bmi/screen/home/cantroller/home_cantroller/home_cantroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationcontroller;
  Animation? leftconposition;
  Animation? rightconposition;
  Animation? textop;
  Animation? compleft;

  HomeCantroller cantroller = Get.put(HomeCantroller());

  @override
  void initState() {
    super.initState();
    animationcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    leftconposition =
        Tween<double>(begin: -3, end: -0.9).animate(animationcontroller!);
    rightconposition =
        Tween<double>(begin: 3, end: 0.9).animate(animationcontroller!);
    textop = Tween<double>(begin: 0, end: 1).animate(animationcontroller!);
    compleft = Tween<double>(begin: -50, end: 0).animate(animationcontroller!);
    animationcontroller!.forward();
    animationcontroller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment(leftconposition!.value, -0.95),
              child: Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.30),
                          offset: Offset(1, 2),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                alignment: Alignment.center,
                child: Icon(Icons.grid_view_rounded,
                    size: 20, color: Colors.blueGrey.shade700),
              ),
            ),
            Opacity(
                opacity: textop!.value,
                child: Align(
                    alignment: Alignment(0, -0.92),
                    child: Text(
                      "BMI Calculator",
                      style: TextStyle(
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp),
                    ))),
            Align(
              alignment: Alignment(rightconposition!.value, -0.95),
              child: Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.30),
                          offset: Offset(1, 2),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                alignment: Alignment.center,
                child: Icon(Icons.person,
                    size: 20, color: Colors.blueGrey.shade700),
              ),
            ),
            Align(
              alignment: Alignment(leftconposition!.value, -0.75),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    cantroller.gender.value = "male";
                  },
                  child: Container(
                    height: 7.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: cantroller.gender.value == "male"
                            ? Colors.blueGrey.shade700
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.30),
                              offset: Offset(1, 2),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    alignment: Alignment.center,
                    child: Text("Male",
                        style: TextStyle(
                            color: cantroller.gender.value == "male"
                                ? Colors.white
                                : Colors.blueGrey.shade700,
                            fontSize: 20.sp)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(rightconposition!.value, -0.75),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    cantroller.gender.value = "female";
                  },
                  child: Container(
                    height: 7.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: cantroller.gender.value == "male"
                            ? Colors.white
                            : Colors.blueGrey.shade700,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.30),
                              offset: Offset(1, 2),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    alignment: Alignment.center,
                    child: Text("Female",
                        style: TextStyle(
                            color: cantroller.gender.value == "male"
                                ? Colors.blueGrey.shade700
                                : Colors.white,
                            fontSize: 20.sp)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(leftconposition!.value, 0.02),
              child: Container(
                width: 45.w,
                height: 55.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.30),
                          offset: Offset(1, 2),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Height",
                      style: TextStyle(
                          color: Colors.blueGrey.shade700, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Container(
                      height: 50.h,
                      width: 20.h,
                      child: Obx(
                        () => SfSlider.vertical(
                          inactiveColor:
                              Colors.blueGrey.shade700.withOpacity(0.20),
                          activeColor: Colors.blueGrey.shade700,
                          max: 200,
                          interval: 10,
                          showTicks: true,
                          enableTooltip: true,
                          showLabels: true,
                          value: cantroller.hei.value,
                          onChanged: (value) {
                            cantroller.changehei(value);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(rightconposition!.value, 0.02),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 45.w,
                    height: 26.5.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.30),
                              offset: Offset(1, 2),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                              color: Colors.blueGrey.shade700, fontSize: 18.sp),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Obx(() => Text(
                              "${cantroller.weg.value}",
                              style: TextStyle(
                                  fontSize: 75.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blueGrey.shade700),
                            )),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                cantroller.wegremove();
                              },
                              child: Container(
                                  height: 12.w,
                                  width: 12.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey
                                                .withOpacity(0.30),
                                            offset: Offset(1, 2),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ]),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade700,
                                        fontSize: 40.sp),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                cantroller.wegAdd();
                              },
                              child: Container(
                                  height: 12.w,
                                  width: 12.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey
                                                .withOpacity(0.30),
                                            offset: Offset(1, 2),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ]),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade700,
                                        fontSize: 30.sp),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 45.w,
                    height: 26.5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.30),
                            offset: Offset(1, 2),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              color: Colors.blueGrey.shade700, fontSize: 18.sp),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Obx(() => Text(
                              "${cantroller.age.value}",
                              style: TextStyle(
                                  fontSize: 75.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blueGrey.shade700),
                            )),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                cantroller.Ageremove();
                              },
                              child: Container(
                                  height: 12.w,
                                  width: 12.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey
                                                .withOpacity(0.30),
                                            offset: Offset(1, 2),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ]),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade700,
                                        fontSize: 40.sp),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                cantroller.AgeAdd();
                              },
                              child: Container(
                                  height: 12.w,
                                  width: 12.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey
                                                .withOpacity(0.30),
                                            offset: Offset(1, 2),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ]),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade700,
                                        fontSize: 30.sp),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(compleft!.value, 0.9),
              child: InkWell(
                onTap: () {
                  if (cantroller.hei > 0 && cantroller.weg > 0) {
                    cantroller.calulat();
                    Get.toNamed('second');
                  } else {
                    Get.showSnackbar(GetSnackBar(
                      borderRadius: 15,
                      margin: EdgeInsets.all(10),
                      backgroundColor: Colors.white70,
                      messageText: Text("Enter the wegight and hight...",
                          style: TextStyle(color: Colors.blueGrey.shade700)),
                      titleText: Text("Error",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade700)),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                child: Container(
                  height: 7.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade700,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.30),
                            offset: Offset(1, 2),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ]),
                  alignment: Alignment.center,
                  child: Text("Let's Begin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
