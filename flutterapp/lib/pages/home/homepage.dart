import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home/homepagestate.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}