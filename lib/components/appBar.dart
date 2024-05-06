// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void dispose() {}
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
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
                  color: Colors.grey[900],
                  size: 30,
                ),
              ),
              Text(
                "Xillica",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                // onTap: () {
                //   Navigator.pushNamed(context, '/login');
                // },
                child: Icon(
                  Icons.notifications,
                  color: Colors.grey[900],
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: 'Search..',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}
