import 'package:flutter/material.dart';
import '../Data/UserDB.dart';
//import 'package:japanese_explorer/Pages/MainPage.dart';
import '../Pages/TopicsPage.dart';
import '../Pages/StudyPage.dart';
import '../Pages/CulturePage.dart';
import '../Pages/RadioPage.dart';
import '../Pages/VideoPage.dart';
import '../Pages/WordsPage.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (_) => MultiProvider (
              providers: [
                Provider(create: (_) => UserDatabase().topicDao,),
              ],
              child: TopicsPage()
            ));
      case '/Study' :
        if (args is String) {
          return MaterialPageRoute(
            builder:  (_) => Provider (
              create: (_) => UserDatabase().topicDao,
              child: StudyPage(data: args),
            )
          );
        }
        return _errorRoute();
      case '/Words' :
        if (args is Topic) {
          return MaterialPageRoute(
            builder:  (_) => MultiProvider(
              providers: [
                Provider(create: (_) => UserDatabase().wordDao),
                Provider(create: (_) => UserDatabase().imageDao),
                Provider(create: (_) => UserDatabase().soundDao)
              ], 
              child: WordsPage( topic: args ), 
            ),
          ) ;
        }
        return _errorRoute();
      case '/Culture' :
        return MaterialPageRoute(
          builder: (_) => CulturePage(),
        );
      case '/Radio' :
        return MaterialPageRoute(
          builder: (_) => RadioPage(),
        );
      case '/Video' :
        return MaterialPageRoute(
          builder: (_) => VideoPage(),
        );
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error page'),
        ),
        body: Center(
          child: Text('Error'),
        )
      );
    });
  }
}