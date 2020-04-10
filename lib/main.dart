import 'dart:async';
import 'Pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'Core/DatabaseAPI.dart';

Database db = Database();

void main() async {
  runApp( MaterialApp(
    home: JapaneseExplorer(),
  ),
  );
}

class SplashScreen extends StatefulWidget {
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 6),
      () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => JapaneseExplorer(),
            ),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 300,
        ),
      ),
    );
  }
}