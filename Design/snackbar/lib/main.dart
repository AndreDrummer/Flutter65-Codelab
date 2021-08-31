import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SnackBarPage(),
    ),
  );
}

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  final snackBar = SnackBar(
    content: Text(
      'Yay! A SnackBar!',
    ),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        print('Operation undone');
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('Show SnackBar'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
