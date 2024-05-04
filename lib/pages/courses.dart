// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/components/appBar.dart';
import 'package:todo_app/components/customBottomNavBar.dart';
import 'package:todo_app/components/drawer.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: CustomDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////////////////////////  App Bar  ///////////////////////////
            ///This is Static
            Column(
              children: [
                CustomAppBar(),
              ],
            ),
            ////////////////////////  Body  ///////////////////////////
            ///This is Scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.bookmark_add),
                    title: Text(
                      'Courses',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ),
            /////////////////////  Bottom Nav Bar  ////////////////////////
            ///this is Static
            CustomBottomNavBar()
          ]),
    );
  }
}
