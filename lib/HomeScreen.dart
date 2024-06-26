import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ChangeLanguage.dart';
import 'package:getx/CounterExample.dart';
import 'package:getx/FavoriteExample.dart';
import 'package:getx/PostAPI.dart';
import 'package:getx/SwitchButton.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar:AppBar(
        title:const Text('Get-X'),
        backgroundColor:Colors.amberAccent,
      ),
      body:Column(
        children: [
          Card(
            child: ListTile(
              title:const Text('GetX SnackBar'),
              subtitle:const Text('Click to open snack-bar'),
              onTap:(){
                Get.snackbar('SnackBar', 'Opened',
                backgroundColor:Colors.white70,
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX Alert Dialog'),
              subtitle:const Text('Click to open alert dialog'),
              onTap:(){
                Get.defaultDialog(
                  title:'Alert',
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX Themes'),
              subtitle:const Text('Click to change theme'),
              onTap:(){
                Get.bottomSheet(
                    backgroundColor:Colors.white,
                    Column(children: [
                    ListTile(
                      leading:const Icon(Icons.light_mode),
                      title:const Text('Light Mode'),
                      onTap:(){
                        Get.changeTheme(ThemeData.light());
                        Get.back();
                      },
                    ),
                        ListTile(
                      leading:const Icon(Icons.dark_mode),
                      title:const Text('Dark Mode'),
                      onTap:(){
                        Get.changeTheme(ThemeData.dark());
                        Get.back();
                    }
                    )
                  ],)
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX Change Language'),
              subtitle:const Text('Click to change language'),
              onTap:(){
                Get.to(const ChangeLanguage());
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX State Management'),
              subtitle:const Text('Counter example'),
              onTap:(){
                Get.to(const CounterExample());
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX State Management'),
              subtitle:const Text('Favorite example'),
              onTap:(){
                Get.to(const FavoriteItems());
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX State Management'),
              subtitle:const Text('Switch button example'),
              onTap:(){
                Get.to(const SwitchButton());
              },
            ),
          ),
          Card(
            child: ListTile(
              title:const Text('GetX State Management'),
              subtitle:const Text('Post API example'),
              onTap:(){
                Get.to(PostAPI());
              },
            ),
          ),
        ],
      ),
    );
  }
}
