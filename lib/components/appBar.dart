// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.only(left: 20, top: 70, right: 20, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.grey[100],
                  size: 30,
                ),
              ),
              GestureDetector(
                // onTap: () {
                //   Navigator.pushNamed(context, '/login');
                // },
                child: Icon(
                  Icons.notifications,
                  color: Colors.grey[100],
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                "Xillica",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        ]));
  }
}
