// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current route
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    ///////////////// Basic Customs //////////////////
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///////////// Drawer Top Content ////////////////
            Column(children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                ),
                child: Center(
                  child: Text(
                    'Xillica',
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                tileColor:
                    currentRoute == '/dashboard' ? Colors.grey[300] : null,
                onTap: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_rounded),
                title: Text('Cart'),
                tileColor: currentRoute == '/cart' ? Colors.grey[300] : null,
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              ListTile(
                leading: Icon(Icons.category_rounded),
                title: Text('Categories'),
                tileColor:
                    currentRoute == '/categories' ? Colors.grey[300] : null,
                onTap: () {
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                tileColor: currentRoute == '/camera' ? Colors.grey[300] : null,
                onTap: () {
                  Navigator.pushNamed(context, '/camera');
                },
              ),
            ]),

            //////////////// Drawer Bottom Content ///////////////////////////
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    // Navigate to desired screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
            // Add more ListTile widgets for additional menu items
          ],
        ),
      ),
    );
  }
}
