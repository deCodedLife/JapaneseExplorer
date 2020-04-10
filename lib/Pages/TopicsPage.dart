import '../Data/UserDB.dart' as DB;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swipedetector/swipedetector.dart';

bool block = false;
bool deny = false;

class TopicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TopicView());
  }
}

class TopicView extends StatefulWidget {
  @override
  _TopicViewState createState() => _TopicViewState();
}

class Data {
  final List<DB.Topic> topics;
  final DB.TopicDao topicsDao;
  Data(this.topics, this.topicsDao);
}

class MainApp extends StatefulWidget {
  final Data allData;
  MainApp({
    Key key,
    @required this.allData,
  }) : super(key: key);
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<DB.Topic> topics = List<DB.Topic>();
  String topicName;
  String topicDiscription;
  bool topicNameController = false;
  bool topicDiscriptionController = false;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    if (topics.length == 0) {
      topics = widget.allData.topics;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Your topics'),
      ),
      body: SwipeDetector(
        onSwipeLeft: () {
          print('Yollo1');
          Navigator.of(context).pushNamed('/Study', arguments: 'New');
        },
        onSwipeDown: () {
          print('upddate');
          block = false;
          deny = false;
          Navigator.pushReplacementNamed(context, '/');
        },
        onSwipeUp: () {
          print('Yollo');
        },
        child: RefreshIndicator(
            onRefresh: () => refreshpage(
                  widget.allData.topicsDao,
                ),
            child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (BuildContext contexts, int index) =>
                    buildTopic(contexts, index))),
      ),
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
                          labelText: 'Name', hintText: 'Enter topic name'),
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
                    var topicDao = widget.allData.topicsDao;
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

  Future<Null> refreshpage(DB.TopicDao topicsDao) async {
    refreshKey.currentState?.show();
    var _topics = topicsDao.getAllTopics();
    _topics.then((req) {
      setState(() {topics = req;});
    });
    await Future.delayed(Duration(seconds: 3));
    return null;
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
      onTap: () {
        Navigator.of(context).pushNamed('/Words', arguments: topic);
      },
      trailing: Icon(Icons.more_vert),
    );
  }
}

class _TopicViewState extends State<TopicView> {
  List<DB.Topic> topics = List<DB.Topic>();
  DB.TopicDao topicsDaos;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainApp(
                      allData: Data(
                        topics,
                        topicsDaos,
                      ),
                    )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final topicsDao = Provider.of<DB.TopicDao>(context);
    load(topicsDao);
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.purpleAccent,
          size: 50.0,
        ),
      ),
    );
  }

  void load(DB.TopicDao topicDao) async {
    if (topics.length == 0 && !block) {
      var _topics = topicDao.getAllTopics();
      _topics.then( (req) => 
        setState(() {
        topicsDaos = topicDao;
        topics = req;
        if (req.length == 0 || req.length == 1) block = true;
      })
      );      
    }
  }
}
