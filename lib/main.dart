import 'package:flutter/material.dart';
import 'package:picsum/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lorem Picsum',
      home: HomePage(),
    );
  }
}
