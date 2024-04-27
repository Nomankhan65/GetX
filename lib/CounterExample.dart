import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterExample extends StatelessWidget {
  const CounterExample({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuild');
   final Counter counter=Get.put(Counter());
   List<String> cars=['BMW','Toyota','Honda'];
   return  Scaffold(
      floatingActionButton:FloatingActionButton(onPressed:(){
        counter.increment();
      },
      child:const Icon(Icons.add),
      ),
      appBar:AppBar(
        title:const Text('GetX state management'),
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:
            [
              //GetX Example One container color opacity-------------------
          Obx(() => Container(
            height:100,
            width:100,
            color:Colors.amber.withOpacity(counter.opacity.value.toDouble()),
          ),),
          Obx(() => Slider(value:counter.opacity.value.toDouble(), onChanged:(val){
            counter.setOpacity(val);
          }), ),


          const Divider(),
              //GetX Example Two counter----------------------------------
          Obx(() =>Text(counter.counter.toString())),

        ],
      )
    );
  }
}
class Counter extends GetxController{

  //Text counter
  RxInt counter=0.obs;
     increment(){
       counter.value++;
       print(counter.value);
  }


  //Container color opacity change
  RxDouble opacity=1.0.obs;
  setOpacity(value){
       opacity.value=value;
       print(opacity.value);
  }
}
