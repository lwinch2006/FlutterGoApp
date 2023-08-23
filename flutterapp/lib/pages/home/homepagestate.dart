import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home/homepage.dart';
import 'package:flutterapp/services/goservices.dart';

class MyHomePageState extends State<MyHomePage> {
  String _greeting = "";
  int? _randomNumber;

  void _actionButtonPressed() async {
    var goServices = const GoServices();
    var randomNumber = await goServices.getRandomNumber();
    var greeting = await goServices.getGreeting();

    setState(() {
      _greeting = greeting;
      _randomNumber = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                    'Greeting: '
                ),
                Text(
                  _greeting,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                    'Random number: '
                ),
                Text(
                  "${_randomNumber ?? ""}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _actionButtonPressed,
        tooltip: 'Call Go library',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}