import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/UserDB.dart';

class WordsPage extends StatelessWidget {
  final Topic topic;
  WordsPage({
    Key key,
    @required this.topic,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words of ' + topic.name),
      ),
      body: WordsPageView(topic: topic),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add card',
        child: Icon(Icons.add),
      ),
    );
  }
}

class WordsPageView extends StatefulWidget {
  final Topic topic;
  WordsPageView({
    Key key,
    @required this.topic,
  }) : super(key: key);
  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPageView> {
  List<Word> words = List<Word>();
  List<String> temp = List<String>();

  @override
  Widget build(BuildContext context) {
    setState(() async {
      final dao = Provider.of<WordDao>(context);
      words = await dao.getByTopic(widget.topic.id);
      for (int i = 0; i < words.length; i++) temp.add(words.elementAt(i).word);
    });
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Orientation == Orientation.portrait ? 3 : 2),
          itemCount: words.length,
          itemBuilder: (BuildContext context, int index) =>
              buildCard(context, index)),
    );
  }

  /*
  StreamBuilder<List<DB.Word>> buildList(BuildContext context) {
    final dao = Provider.of<DB.WordDao>(context);
    return StreamBuilder(
      stream: dao.getByTopic(widget.topic.id).
      builder: (context, AsyncSnapshot<List<DB.Topic>> snapshot) {
        final topics = snapshot.data ?? List();
        return ;
      },
    );
  }
  */
  Widget buildCard(BuildContext context, int index) {
    final word = words.elementAt(index);
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
