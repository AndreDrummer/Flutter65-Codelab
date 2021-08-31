import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('Go!'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var end = Offset.zero;
      var curve = Curves.ease;
      var begin = Offset(0.0, 1.0);
      var curveTween = CurveTween(curve: curve);
      var tween = Tween(begin: begin, end: end).chain(curveTween);
      var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
      var offSetAnimation = animation.drive(tween);
      return SlideTransition(
        // The 2 following lines makes the same result. One uses CurvedAnimation and the other uses Animation<Offset>.
        position: offSetAnimation,
        // position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
