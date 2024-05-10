import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Xillica/components/appBar.dart';
import 'package:Xillica/components/customBottomNavBar.dart';
import 'package:Xillica/components/drawer.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////// App Bar /////////////////////
          CustomAppBar(),
          Expanded(
            //////////////////// Scrollable Content /////////////////////
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///////////////////// Body /////////////////////
                  Cards(),
                ],
              ),
            ),
          ),
          // Bottom Nav Bar
          CustomBottomNavBar(),
        ],
      ),
    );
  }

  Cards() {
    List<Map<String, dynamic>> roundedItems = [
      {
        'icon': Icons.home,
        'text': 'Home',
      },
      {
        'icon': Icons.bookmark_add,
        'text': 'Cart',
      },
      {
        'icon': Icons.category_rounded,
        'text': 'Categories',
      },
      {
        'icon': Icons.search,
        'text': 'Search',
      },
      {
        'icon': Icons.notifications,
        'text': 'Notifications',
      },
      {
        'icon': Icons.person,
        'text': 'Profile',
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: roundedItems.map((data) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 170,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Icon(
                            data['icon'],
                            color: Colors.grey[100],
                            size: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              data['text'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[100]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
