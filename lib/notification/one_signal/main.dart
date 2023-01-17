import 'package:flutter/material.dart';
import 'package:testnotification/notification/one_signal/second_page.dart';
import 'one_signal.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Signal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const OneSignalNotification(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondPage(),
      },
      navigatorKey: navigatorKey,
    );
  }
}
