import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/UserDB.dart' as DB;
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool block = false;
bool deny = false;

class Data {
  final List<DB.Word> words;
  final DB.WordDao wordsDao;
  final DB.Topic topic;
  Data(this.words, this.wordsDao, this.topic);
}

class WordsView extends StatefulWidget {
  final DB.Topic topic;
  WordsView({
    Key key,
    @required this.topic,
  }) : super(key: key);
  @override
  _WordsViewState createState() => _WordsViewState();
}

class _WordsViewState extends State<WordsView> {
  List<DB.Word> words = List<DB.Word>();
  DB.WordDao wordsDao;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainView(
              allData: Data(words, wordsDao, widget.topic),
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordDao = Provider.of<DB.WordDao>(context);
    load(wordDao);
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading words'),
      ),
      body: Center(
        child: SpinKitRing(
          color: Colors.purpleAccent,
          size: 50.0,
        ),
      ),
    );
  }

  void load(DB.WordDao wordDao) async {
    if (words.length == 0 && !block) {
      var _words = wordDao.getByTopic(widget.topic.id);
      _words.then((req) => setState(() {
            wordsDao = wordDao;
            words = req;
            if (req.length == 0 || req.length == 1) block = true;
          }));
    }
  }
}

class MainView extends StatefulWidget {
  final Data allData;
  MainView({
    Key key,
    @required this.allData,
  }) : super(key: key);
  @override
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<String> temp = List<String>();

  @override
  Widget build(BuildContext context) {
    setState(() {
      for (int i = 0; i < widget.allData.words.length; i++)
        temp.add(widget.allData.words.elementAt(i).word);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Words of ' + widget.allData.topic.name),
      ),
      body: Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Orientation == Orientation.portrait ? 3 : 2),
            itemCount: temp.length,
            itemBuilder: (BuildContext context, int index) =>
                buildCard(context, index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add card',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    final word = widget.allData.words.elementAt(index);
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (temp.elementAt(index) == word.word)
              temp[index] = word.translate;
            else
              temp[index] = word.word;
          });
        },
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                Text(
                  temp[index],
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WordsPage extends StatelessWidget {
  final DB.Topic topic;
  WordsPage({
    Key key,
    @required this.topic,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WordsView(topic: topic));
  }
}
