import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: AnimatedContainerApp(),
    ),
  );
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  Timer timer;

  void _runAnimation() {
    setState(() {
      final random = Random();
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );

      _borderRadius = BorderRadius.only(
        bottomLeft: Radius.elliptical(
          random.nextInt(100).toDouble(),
          random.nextInt(100).toDouble(),
        ),
        topLeft: Radius.elliptical(
          random.nextInt(100).toDouble(),
          random.nextInt(100).toDouble(),
        ),
        bottomRight: Radius.elliptical(
          random.nextInt(100).toDouble(),
          random.nextInt(100).toDouble(),
        ),
        topRight: Radius.elliptical(
          random.nextInt(100).toDouble(),
          random.nextInt(100).toDouble(),
        ),
      );
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => _runAnimation(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runAnimation,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
