// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/components/appBar.dart';
import 'package:todo_app/components/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: CustomDrawer(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomAppBar(),
        Column(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_outlined), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Categories'),
        ],
      ),
    );
  }
}
