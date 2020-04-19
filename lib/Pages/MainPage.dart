import 'package:flutter/material.dart';
import 'package:japanese_explorer/Pages/Options.dart';
import 'package:provider/provider.dart';
import 'TopicsPage.dart';
import '../Core/Logic.dart';
import '../Data/UserDB.dart';

MaterialColor _theme = Colors.purple;
BuildContext globalContext;
TopicDao globalTopicDao;

class JapaneseExplorer extends StatelessWidget {
  final List<String> cards = ['Recent', 'Update', 'Options'];

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    globalTopicDao = Provider.of<TopicDao>(context);
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: _theme,
          buttonColor: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      title: 'Japanese Explorer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Japanese explorer'),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) =>
              buildCard(context, index),
        ),
      ),
    );
    return materialApp;
  }

  Widget buildCard(BuildContext context, int index) {
    return Card(
      elevation: 2,
      child: Container(
        child: GestureDetector(
          onTap: () {
            if (index == 0) {
              var response = AppLogic().getRecent(globalTopicDao);
              response.then((result) {
                TopicsLogic().setTemporary(result);
                TopicsLogic().loadAll(globalContext);
              });
            }
            if (index == 1) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          'Info',
                          style: TextStyle(
                              fontSize: 24, color: Colors.purpleAccent),
                        ),
                        content: Text('No updates avaible'),
                        actions: <Widget>[
                          MaterialButton(
                              textColor: Colors.purpleAccent,
                              child: Text('Ok'),
                              onPressed: () => Navigator.pop(context))
                        ],
                      ));
            }
            if (index == 2) {
              Navigator.push(globalContext,
                  MaterialPageRoute(builder: (context) => OptionsPage()));
            }
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Spacer(),
                Icon(
                  index == 0
                      ? Icons.history
                      : index == 1 ? Icons.cloud_download : Icons.settings,
                  size: 42.0,
                ),
                Spacer(),
                Text(
                  cards.elementAt(index),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
