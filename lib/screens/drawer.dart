import 'package:coffee_ui/utils/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/constants/strings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children: [
                Image.asset(Images.espressoImg, height: 50, width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  SizedBox(height: 20, width: 20),
                  CustomTextStyle(data: "Anshika Dixit", fonTSize: 18, color: Colors.white, fontWeight: FontWeight.bold,),
                  CustomTextStyle(
                      data: "dixitanshika09@gmail.com", fonTSize: 18, color: Colors.white),
                ])
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
