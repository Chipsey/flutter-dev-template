import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key});

  // Define the routes and their corresponding icons and texts
  final List<Map<String, dynamic>> routes = [
    {
      'route': '/dashboard',
      'icon': Icons.home,
      'text': 'Home',
    },
    {
      'route': '/courses',
      'icon': Icons.bookmark_add,
      'text': 'Courses',
    },
    {
      'route': '/categories',
      'icon': Icons.category_rounded,
      'text': 'Categories',
    },
    {
      'route': '/profile',
      'icon': Icons.person,
      'text': 'Profile',
    },
  ];

  checkCurrentRoute(String checkingRoute, String currentRoute) {
    return checkingRoute == currentRoute;
  }

  @override
  Widget build(BuildContext context) {
    ///////////// Get the current route ////////////////
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Container(
      height: 100, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///////////// Content //////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: routes.map((routeData) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (routeData['route'] != currentRoute)
                      Navigator.pushNamed(context, routeData['route']);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Icon(
                          routeData['icon'],
                          color: checkCurrentRoute(
                                  routeData['route'], currentRoute)
                              ? Colors.blueGrey[900]
                              : Colors.grey[500],
                          size: 20,
                        ),
                        Text(
                          routeData['text'],
                          style: TextStyle(
                            color: checkCurrentRoute(
                                    routeData['route'], currentRoute)
                                ? Colors.blueGrey[900]
                                : Colors.grey[500],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
