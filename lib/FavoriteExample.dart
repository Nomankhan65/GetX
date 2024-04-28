import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    final Favorite favorite=Get.put(Favorite());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:favorite.cars.length,
                itemBuilder: (context,index){
                  final car=favorite.cars[index];
              return Obx(() => Card(
                child: ListTile(
                  onTap:(){
                    if(favorite.tempList.contains(car)){
                      favorite.removeFromFav(car);
                    }
                    else
                      {
                        favorite.addToFav(car);
                      }
                  },
                  title:Text(favorite.cars[index]),
                  trailing:  Icon(Icons.favorite,color:favorite.tempList.contains(car)?Colors.red:Colors.black26,),
                ),
              ));
            }),
          ),
          Obx(() =>Expanded(
            child: ListView.builder(
              itemCount: favorite.tempList.length,
              itemBuilder: (context, index) {
                final car = favorite.tempList[index].toString(); // Use tempList instead of cars
                return  Card(
                  child: ListTile(
                    onTap: () {
                      if (favorite.tempList.contains(car)) {
                        favorite.removeFromFav(car);
                      }
                    },
                    title: Text(car), // Use car instead of favorite.cars[index]
                    trailing: Icon(
                      Icons.favorite,
                      color: favorite.tempList.contains(car) ? Colors.red : Colors.black26,
                    ),
                  ),
                );
              },
            ),
          ),)

        ],
      ),
    );
  }
}
class Favorite extends GetxController{

  RxList<String> cars=['BMW','Toyota','Honda','Mercy dies'].obs;
  RxList tempList=[].obs;

  addToFav(index){
    tempList.add(index);
    print(tempList.value);
  }
  removeFromFav(index){
    tempList.remove(index);
  }

}
