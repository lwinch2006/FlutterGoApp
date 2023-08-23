import 'package:flutter/services.dart';
import 'package:flutterapp/constants.dart';

class GoServices {
  static const _channel = MethodChannel(goServicesChannelName);

  const GoServices();

  Future<String> getGreeting() async {
    String greeting = "";

    try {
      greeting = await _channel.invokeMethod('getGreeting');
    } on PlatformException catch (e) {
      //...
    }

    return greeting;
  }

  Future<int?> getRandomNumber() async {
    int? randomNumber;

    try {
      randomNumber = await _channel.invokeMethod('getRandomNumber');
    } on PlatformException catch (e) {
      //...
    }

    return randomNumber;
  }
}