import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class PostAPI extends StatelessWidget {
  const PostAPI({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
       PostController  postController=Get.put(PostController());
    return Scaffold(
      appBar:AppBar(
        title:Text('Login API'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
         TextField(
           controller:postController.email.value,
           decoration:InputDecoration(
             label:Text('Email'),
           ),
         ),
            SizedBox(height:20,),
            TextField(
              controller:postController.password.value,
              decoration:InputDecoration(
                label:Text('Password'),
              ),
            ),
            SizedBox(height:20,),
           Obx(() => SizedBox(
             width:200,
             height:50,
             child: ElevatedButton(onPressed: (){
                postController.login();
              }, child:postController.loading.value?Center(child: CircularProgressIndicator()):Text('Login')),
           ))
          ],
        ),
      ),
    );
  }
}
class PostController extends  GetxController{

    Rx<TextEditingController> email=TextEditingController().obs;
    Rx<TextEditingController> password=TextEditingController().obs;
    RxBool loading=false.obs;

   login()async{
     try{
       loading.value=true;
       final res=await http.post(Uri.parse('https://reqres.in/api/login'),
           body:{
           'email':email.value.text,
             'password':password.value.text,
           }
       );
       if(res.statusCode==200){
         Get.snackbar('Congrats!','Login Success',backgroundColor:Colors.lightBlueAccent);
       }
       else{
         Get.snackbar('Error!','Login Fail',backgroundColor:Colors.redAccent);
       }

     }catch (e)
     {
       loading.value=false;
       Get.snackbar('Error!',e.toString(),backgroundColor:Colors.redAccent);
     }finally{
       loading.value=false;
     }
     

   }

}
