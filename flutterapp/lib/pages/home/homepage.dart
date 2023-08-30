import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home/homepagestate.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => HomePageState();
}