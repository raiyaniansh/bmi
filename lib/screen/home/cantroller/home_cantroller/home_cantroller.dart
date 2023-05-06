import 'package:get/get.dart';

class HomeCantroller extends GetxController
{
  RxInt age = 00.obs;
  RxInt hei = 00.obs;
  RxInt weg = 00.obs;
  RxString gender = "male".obs;
  RxString body = "".obs;
  RxDouble bmi = 0.0.obs;

  void AgeAdd()
  {
    age++;
  }

  void wegAdd()
  {
    weg.value = weg.value+5;
  }

  void Ageremove()
  {
    if(age.value>0)
      {
        age--;
      }
  }

  void wegremove()
  {
    if(weg.value>0)
    {
      weg--;
    }
  }

  void changehei(double value)
  {
    hei.value=value.toInt();
  }

  void calulat()
  {
    bmi.value = weg.value/(hei.value*hei.value/10000);
    if(bmi.value<18.5)
      {
        body.value="Underweight";
      }
    else if(bmi.value<25)
      {
        body.value="Normal";
      }
    else if(bmi.value<30)
      {
        body.value="Overweight";
      }
    else
      {
        body.value="Obesity";
      }
  }
}