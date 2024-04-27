import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Favorite favorite=Get.put(Favorite());
    return ListView.builder(
        itemCount:favorite.cars.length,
        itemBuilder: (context,index){
      return Obx(() => Card(
        child: ListTile(
          onTap:(){
            if(favorite.tempList.contains(index)){
              favorite.removeFromFav(index);
            }
            else
              {
                favorite.addToFav(index);
              }
          },
          title:Text(favorite.cars[index]),
          trailing:  Icon(Icons.favorite,color:favorite.tempList.contains(index)?Colors.red:Colors.black26,),
        ),
      ));
    });
  }
}
class Favorite extends GetxController{

  RxList<String> cars=['BMW','Toyota','Honda','Mercy dies'].obs;
  RxList tempList=[].obs;

  addToFav(index){
    tempList.add(index);
  }
  removeFromFav(index){
    tempList.remove(index);
  }

}
