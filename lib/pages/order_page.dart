import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final String name;
  final String description;
  final double price;
  final String image;
  const Order({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OrderDetails(
                    name: widget.name,
                    description: widget.description,
                    price: widget.price,
                    image: widget.image,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget OrderDetails({
    required String name,
    required String description,
    required double price,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image on the left side (square size)
          SizedBox(
            width: 175, // Adjust the width as needed
            height: 175, // Same as width to make it square
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20), // Add spacing between image and details
          // Details on the right side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${price.toStringAsFixed(2)}', // Format price with 2 decimal places
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
