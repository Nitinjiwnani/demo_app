import 'package:demo_app/user_data/user_data.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Outshade Digital Media"),
        ),
        body: user_data);
  }
}
