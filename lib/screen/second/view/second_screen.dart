import 'package:bmi/screen/home/cantroller/home_cantroller/home_cantroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with SingleTickerProviderStateMixin{
  HomeCantroller cantroller = Get.put(HomeCantroller());
  AnimationController? animationController;
  Animation? bmi;
  Animation? leftconposition;
  Animation? rightconposition;
  Animation? textop;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    leftconposition =
        Tween<double>(begin: -3, end: -0.9).animate(animationController!);
    rightconposition =
        Tween<double>(begin: 3, end: 0.9).animate(animationController!);
    textop = Tween<double>(begin: 0, end: 1).animate(animationController!);
    bmi = Tween<double>(begin: 0.0,end: cantroller.bmi.value).animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
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
              child: InkWell(
                onTap: () {
                  Get.back();
                },
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
                  child: Icon(Icons.arrow_back_ios_new_sharp,
                      size: 20, color: Colors.blueGrey.shade700),
                ),
              ),
            ),
            Opacity(
                opacity: textop!.value,
                child: Align(
                    alignment: Alignment(0, -0.92),
                    child: Text(
                      "BMI Results",
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
              alignment: Alignment(0, 0),
              child: Container(
                height: 39.h,
                width: 39.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.20),
                          offset: Offset(1, 2),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: SimpleCircularProgressBar(
                animationDuration: 20,
                onGetText: (p0) {
                  return Text("${(bmi!.value).toString().substring(0,4)}",style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700),);
                },
                backColor: Colors.black12,
                progressColors: [
                  Colors.blueGrey.shade500,
                  Colors.blueGrey.shade900,
                  Colors.blueGrey.shade900,
                  Colors.blueGrey.shade900,
                  Colors.blueGrey.shade900,
                ],
                mergeMode: true,
                maxValue: 50,
                size: 30.h,
                valueNotifier: ValueNotifier(cantroller.bmi.value),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("You have",style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 20.sp),),
                  Obx(() => Text(" ${cantroller.body.value} ",style: TextStyle(color: Colors.blueGrey.shade900,fontSize: 25.sp,fontWeight: FontWeight.bold),)),
                  Text("body weight",style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 20.sp),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
