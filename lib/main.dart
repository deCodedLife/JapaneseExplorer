import 'Pages/CulturePage.dart';
import 'Pages/StudyPage.dart';
import 'Pages/TopicsPage.dart';
import 'Pages/VideoPage.dart';
import 'package:provider/provider.dart';
import 'Data/UserDB.dart';
import 'Pages/MainPage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonColor: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  var controller = PageController();

  List<MultiProvider> pages = [
    MultiProvider (providers: [], child: JapaneseExplorer()),
    MultiProvider (
      providers: [
        Provider(create: (_) => UserDatabase().topicDao)
      ],
      child: TopicsPage()),
    MultiProvider(
      providers: [
        Provider(create: (_) => UserDatabase().topicDao)
      ],
      child: StudyPage(),
    ),
    MultiProvider(
      providers: [
        Provider(create: (_) => UserDatabase().videoDao,)
      ],
      child: VideoPage(),
    ),
    MultiProvider(
      providers: [],
      child: CulturePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color:
                        selectedPage == 0 ? Colors.purpleAccent : Colors.grey),
                title: Text('Home', style: TextStyle(color: Colors.black))),
            BottomNavigationBarItem(
                icon: Icon(Icons.list,
                    color:
                        selectedPage == 1 ? Colors.purpleAccent : Colors.grey),
                title: Text('Topics', style: TextStyle(color: Colors.black))),
            BottomNavigationBarItem(
                icon: Icon(Icons.school,
                    color:
                        selectedPage == 2 ? Colors.purpleAccent : Colors.grey),
                title: Text('Study', style: TextStyle(color: Colors.black))),
            BottomNavigationBarItem(
                icon: Icon(Icons.videocam,
                    color:
                        selectedPage == 3 ? Colors.purpleAccent : Colors.grey),
                title: Text('Videos', style: TextStyle(color: Colors.black))),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule,
                    color:
                        selectedPage == 4 ? Colors.purpleAccent : Colors.grey),
                title: Text('Culture', style: TextStyle(color: Colors.black)))
          ],
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
              controller.animateToPage(selectedPage,
                  duration: Duration(microseconds: 200),
                  curve: Curves.easeInOutCubic);
            });
          },
        ),
        body: PageView(
          controller: controller,
          children: pages,
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
