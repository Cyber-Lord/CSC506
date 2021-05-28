import 'package:csc506/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSC506',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        canvasColor: Colors.white54,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
