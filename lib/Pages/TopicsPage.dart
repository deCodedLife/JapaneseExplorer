import 'AdditionalData/TopicPopup.dart';
import '../Core/routeGenerator.dart';
import '../Data/UserDB.dart' as DB;
import 'WordsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

bool block = false;
bool deny = false;
var globalContext;

class TopicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonColor: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      home: MainApp(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MainApp extends StatefulWidget {
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  DB.TopicDao topicsDao;
  List<DB.Topic> topics = List<DB.Topic>();
  String topicName;
  String topicDiscription;
  bool topicNameController = false;
  bool topicDiscriptionController = false;
  String newTopicName;
  String newTopicDiscription;
  bool newTopicNameController = false;
  bool newTopicDiscriptionController = false;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final topicsDao = Provider.of<DB.TopicDao>(context);
    if (topics.length == 0) {
      refreshpage(topicsDao);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Your topics'),
      ),
      body: RefreshIndicator(
          onRefresh: () => refreshpage(
                topicsDao,
              ),
          child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (BuildContext contexts, int index) =>
                  buildTopic(contexts, index))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              'Add new topic',
              style: TextStyle(
                fontSize: 24,
                color: Colors.purpleAccent,
              ),
            ),
            content: new SingleChildScrollView(
              child: new Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new TextFormField(
                    validator: (String text) {
                      if (text.length == 0) return 'Required';
                      if (text.length > 20) return 'Too long';
                      if (text == '' || text == "") return 'Required';
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Name *', hintText: 'Enter topic name'),
                    onChanged: (String text) {
                      setState(() {
                        topicNameController = false;
                        if (text != topicName) topicName = text;
                      });
                    },
                  ),
                  new TextFormField(
                    validator: (String text) {
                      if (text.length == 0) return 'Required';
                      if (text.length > 20) return 'Too long';
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Description *',
                        hintText: 'Enter description'),
                    onChanged: (String text) {
                      setState(() {
                        topicDiscriptionController = false;
                        if (text != topicDiscription) topicDiscription = text;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                textColor: Colors.purpleAccent,
                child: Text('submit'),
                onPressed: () {
                  if (topicName.length != 0 && topicDiscription.length != 0) {
                    Navigator.pop(context);
                    var topicDao = topicsDao;
                    if (topicName != null && topicDiscription != null) {
                      var insertTopic = topicDao.addTopic(DB.Topic(
                        id: null,
                        name: topicName,
                        description: topicDiscription,
                      ));
                      insertTopic.then((res) {
                        refreshpage(topicDao);
                      });
                    } else {}
                  } else {}
                },
              ),
            ],
          ),
        ), //Navigator.of(context).pushNamed('/Topic', arguments: ''),
        tooltip: 'Add topic',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Null> refreshpage(DB.TopicDao currentTopicsDao) async {
    refreshKey.currentState?.show();
    var _topics = currentTopicsDao.getAllTopics();
    _topics.then((req) {
      setState(() {
        topics = req;
        topicsDao = currentTopicsDao;
      });
    });
    await Future.delayed(Duration(seconds: 3));
    return null;
  }

  void make(DB.Topic topic) {
    Navigator.push(
          globalContext,
          MaterialPageRoute(
              builder: (context) => MultiProvider(
                    providers: [
                      Provider(create: (_) => DB.UserDatabase().wordDao),
                      Provider(create: (_) => DB.UserDatabase().imageDao),
                      Provider(create: (_) => DB.UserDatabase().soundDao)
                    ],
                    child: WordsPage(topic: topic),
                  )));
  }

  Widget buildTopic(BuildContext context, int index) {
    final topic = topics.elementAt(index);
    //final image = images.elementAt(index);
    return ListTile(
        //leading: Image.file(File(image), fit: BoxFit.fill),
        title: Text(
          topic.name,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          topic.description,
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        onTap: () => make(topic),
        trailing: PopupMenuButton<String>(
          onSelected: (String choise) => makeChoise(choise, topic),
          itemBuilder: (BuildContext context) {
            return Tips.choises.map((String choise) {
              return PopupMenuItem<String>(
                value: choise,
                child: Text(choise),
              );
            }).toList();
          },
        ));
  }

  void makeChoise(String choise, DB.Topic topic) {
    if (choise == Tips.delete) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Confirm',
                style: TextStyle(color: Colors.purpleAccent, fontSize: 24),
              ),
              content: Text(
                'Are you shure want to DELETE topic: ' + topic.name + '?',
                style: TextStyle(fontSize: 18),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text('cancel'),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                MaterialButton(
                  child: Text('Submit'),
                  textColor: Colors.purpleAccent,
                  onPressed: () {
                    topicsDao.deleteTopics(topic);
                    refreshpage(topicsDao);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
    if (choise == Tips.edit) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Edit ' + topic.name,
              style: TextStyle(fontSize: 24, color: Colors.purpleAccent),
            ),
            content: new SingleChildScrollView(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new TextFormField(
                    validator: (String text) {
                      if (text.length == 0) return 'Required';
                      if (text.length > 20) return 'Too long';
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Name *', hintText: topic.name),
                    onChanged: (String text) {
                      setState(() {
                        newTopicNameController = false;
                        if (text != newTopicName) newTopicName = text;
                      });
                    },
                  ),
                  new TextFormField(
                    validator: (String text) {
                      if (text.length == 0) return 'Required';
                      if (text.length > 20) return 'Too long';
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Description *',
                        hintText: topic.description),
                    onChanged: (String text) {
                      setState(() {
                        newTopicDiscriptionController = false;
                        if (text != newTopicDiscription)
                          newTopicDiscription = text;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text('Submit'),
                textColor: Colors.purpleAccent,
                onPressed: () {
                  if (newTopicName.length != 0 &&
                      newTopicDiscription.length != 0) {
                    topicsDao.updateTopics(topic.copyWith(
                        name: newTopicName, description: newTopicDiscription));
                    refreshpage(topicsDao);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          );
        },
      );
    }
  }
}
