import 'dart:ui';
import 'dart:async';

import 'package:Xillica/pages/order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Xillica/components/appBar.dart';
import 'package:Xillica/components/customBottomNavBar.dart';
import 'package:Xillica/components/drawer.dart';
import 'package:Xillica/services/notification_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  late Timer _timer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state: " + state.toString());
    if (state == AppLifecycleState.paused) {
      _startPeriodicNotifications();
    } else {
      _stopPeriodicNotifications();
    }
  }

  void _startPeriodicNotifications() {
    _timer = Timer.periodic(Duration(seconds: 6), (Timer timer) {
      NotificationService()
          .showNotification(title: 'Open me', body: 'Open the app now..');
    });
  }

  void _stopPeriodicNotifications() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double fullDisplayWidth = MediaQuery.of(context).size.width;

    Map<String, double> widthList(BuildContext context) {
      return {
        'fullWidth': fullDisplayWidth - 80,
        'halfWidth': (fullDisplayWidth - 90) / 2,
        'textWidthPrimary': fullDisplayWidth / 27,
        'textWidthTitle': fullDisplayWidth / 22,
        'textWidthSecondary': fullDisplayWidth / 40,
      };
    }

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
                  RoundedItems(),
                  Cards(widthList(context)),
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

  RoundedItems() {
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
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Wrap(
        spacing: 30,
        runSpacing: 10,
        alignment: WrapAlignment.spaceBetween,
        children: roundedItems.map((data) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 2), // Offset
                      ),
                    ],
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
            ).animate().move(duration: 900.ms, curve: Easing.legacyDecelerate),
          );
        }).toList(),
      ),
    );
  }

  Cards(Map<String, double> widthList) {
    List<Map<String, dynamic>> cardItems = [
      {
        'title': 'Orange',
        'image': 'assets/images/orange_2.jpg',
        'description':
            'A round citrus fruit with a thick orange peel and sweet, juicy flesh, rich in vitamin C.',
        'price': 1.99,
      },
      {
        'title': 'Strawberry',
        'image': 'assets/images/strawberry.jpg',
        'description':
            'A heart-shaped, red fruit with seeds on its surface, known for its sweet flavor and juicy texture.',
        'price': 2.49,
      },
      {
        'title': 'Lemon',
        'image': 'assets/images/lemon.jpg',
        'description':
            'A bright yellow citrus fruit with a sour taste, commonly used in cooking and beverages.',
        'price': 0.99,
      },
      {
        'title': 'Kiwi',
        'image': 'assets/images/kiwi.jpg',
        'description':
            'A fuzzy brown fruit with green flesh and tiny black seeds, known for its tart flavor.',
        'price': 1.79,
      },
      {
        'title': 'Banana',
        'image': 'assets/images/banana.jpg',
        'description':
            'A long curved fruit with a yellow peel and soft, sweet flesh, often eaten raw or used in desserts.',
        'price': 0.69,
      },
      {
        'title': 'Watermelon',
        'image': 'assets/images/melon.jpg',
        'description':
            'A large, juicy fruit with a thick green rind, pink flesh, and black seeds, often enjoyed in the summer.',
        'price': 3.99,
      },
      {
        'title': 'Cherry',
        'image': 'assets/images/cherry.jpg',
        'description':
            'A small, round fruit with a red or dark purple skin, sweet or tart flavor, and a hard stone in the center.',
        'price': 4.49,
      },
      {
        'title': 'Papaya',
        'image': 'assets/images/papaya.jpg',
        'description':
            'A tropical fruit with a yellow or orange flesh, sweet flavor, and black seeds, rich in vitamins and enzymes.',
        'price': 2.99,
      },
      {
        'title': 'Avocado',
        'image': 'assets/images/avocado.jpg',
        'description':
            'A pear-shaped fruit with green or black skin, creamy texture, and nutty flavor, often used in salads and spreads.',
        'price': 1.49,
      },
    ];

    //Square cards
    double cardWidth = widthList['fullWidth'] ?? 350;
    double cardHeight = widthList['fullWidth'] ?? 350;

    // //Wide cards
    // double cardWidth = widthList['fullWidth'] ?? 350;
    // double cardHeight = 200;

    // Small cards
    // double cardWidth = widthList['halfWidth'] ?? 350;
    // double cardHeight = 200;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: widthList['textWidthPrimary'],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: widthList['textWidthPrimary'],
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[500]),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: cardItems.map((data) {
                return Container(
                  width: cardWidth,
                  height: cardHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            data['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        // Container with transparent gradient overlay
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.9),
                                  Colors.black.withOpacity(1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 60, // Adjust position as needed
                          left: 20, // Adjust position as needed
                          child: Container(
                            width: cardWidth - (cardWidth / 3.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title'],
                                  style: TextStyle(
                                    fontSize: widthList[
                                        'textWidthTitle'], // Adjust font size as needed
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Text color on top of the image
                                  ),
                                ),
                                Text(
                                  data['description'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: widthList[
                                        'textWidthSecondary'], // Adjust font size as needed
                                    fontWeight: FontWeight.w500,
                                    color: Colors
                                        .white, // Text color on top of the image
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: cardWidth,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20)),
                                image: DecorationImage(
                                  image: ExactAssetImage(data['image']),
                                  fit: BoxFit.cover,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20)),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.white.withOpacity(0.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10, // Adjust position as needed
                          left: 20, // Adjust position as needed
                          child: Container(
                            width: cardWidth - 40,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Icon(
                                      Icons.category,
                                      color: Colors.white,
                                      size: 20,
                                      weight: 30,
                                    ),
                                  ),
                                ),
                                /////////// For wide cards ////////////
                                if (cardWidth >= 300)
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Text(
                                        'Buy ${data['title']}, today special',
                                        style: TextStyle(
                                          fontSize:
                                              widthList['textWidthSecondary'],
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("notification");
                                      NotificationService().showNotification(
                                        title: data['title'],
                                        body: data['description'],
                                        imageUrl: data['image'],
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Order(
                                              name: data['title'],
                                              description: data['description'],
                                              price: data['price'],
                                              image: data['image']),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    )
        .animate(delay: 300.ms)
        .move(duration: 900.ms, curve: Easing.legacyDecelerate);
  }
}
