import 'package:cyala/ChatScreen.dart';
import 'package:cyala/MainScreen.dart';
import 'package:flutter/material.dart';
import 'authenticate.dart';
import 'helperFunction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;
  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunction.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CYALA",
      debugShowCheckedModeBanner: false,
      home: userIsLoggedIn != null
          ? userIsLoggedIn ? MainScreens() : Authenticate()
          : Authenticate(),
    );
  }
}
