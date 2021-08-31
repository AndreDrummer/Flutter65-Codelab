import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: UpdateOrientation(),
    ),
  );
}

class UpdateOrientation extends StatefulWidget {
  @override
  _UpdateOrientationState createState() => _UpdateOrientationState();
}

class _UpdateOrientationState extends State<UpdateOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Três e duas colunas'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                children: List.generate(
                  100,
                  (index) => Center(
                    child: Text('Hello'),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
