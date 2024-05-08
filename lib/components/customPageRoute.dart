import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget Function(BuildContext, Animation<double>, Animation<double>)
      builder;

  CustomPageRoute({required this.builder})
      : super(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context, animation, secondaryAnimation);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

// Example usage:
// Navigator.push(
//   context,
//   CustomPageRoute(
//     builder: (context, animation, secondaryAnimation) {
//       return MyNextPage();
//     },
//   ),
// );
