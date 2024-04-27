import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ChangeLanguage.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Get-X'),
        backgroundColor:Colors.amberAccent,
      ),
      body:  Column(
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
        ],
      ),
    );
  }
}
