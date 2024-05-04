import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/components/appBar.dart';
import 'package:todo_app/components/customBottomNavBar.dart';
import 'package:todo_app/components/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> roundedItems = [
      {
        'icon': Icons.home,
        'text': 'Home',
      },
      {
        'icon': Icons.bookmark_add,
        'text': 'Courses',
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

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      'Home',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  //////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 10,
                      alignment: WrapAlignment.spaceBetween,
                      children: roundedItems.map((data) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[900],
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Icon(
                                    data['icon'],
                                    color: Colors.grey[100],
                                    size: 35,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    data['text'],
                                    style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  //////////////////////////////////////////
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
}
