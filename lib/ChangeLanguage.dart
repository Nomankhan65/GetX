import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title:const Text('Change Language'),
      ),
      body:Column(children: [
        ListTile(
          title: Text('message'.tr),
          subtitle:Text('ans'.tr),
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(onPressed:(){
              Get.updateLocale(const Locale('en','US'));
            }, child:const Text('English')),
            OutlinedButton(onPressed:(){
              Get.updateLocale(const Locale('ur','PK'));
            }, child:const Text('Urdu')),
          ],
        )
      ],),
    );
  }
}
