import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    final Button button=Get.put(Button());
    return Scaffold(
      body:Center(
        child:Obx(() =>Switch(value: button.state.value, onChanged: (value){
          button.fun(value);
        }),
      ),
    ));
  }
}

class Button extends GetxController{

  RxBool state=false.obs;

    fun(bool val){
     state.value=val;
     print(state.value);
   }
}
