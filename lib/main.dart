import 'package:flutter/material.dart';
import 'package:trakerorderapp/src/pages/traking_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traking App',
      home: TrakingPage()
    );
  }
}