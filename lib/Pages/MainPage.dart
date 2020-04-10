import 'package:flutter/material.dart';
import 'package:japanese_explorer/Core/routeGenerator.dart';

MaterialColor _theme = Colors.purple;

class JapaneseExplorer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: _theme,
          buttonColor: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      title: 'Japanese Explorer',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
    return materialApp;
  }
}
