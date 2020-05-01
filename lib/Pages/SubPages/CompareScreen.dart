import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../Data/UserDB.dart' as DB;

const cardsCount = 6;

class CompareScreen extends StatefulWidget {
  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {

  DB.TopicDao topicsDao;
  DB.WordDao wordsDao;
  DB.Topic tempTopic;

  int selected;
  List<DB.Word> tempWords;
  List<int> done = List<int>();
  List<int> error = List<int>();

  bool loaded = false;
  bool nekochan = true;

  @override
  Widget build(BuildContext context) {
    topicsDao = Provider.of<DB.TopicDao>(context);
    wordsDao = Provider.of<DB.WordDao>(context);
    if (nekochan) {
      updateAll();
      nekochan = !nekochan;
    }
    if (!loaded) updateAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare game'),
      ),
      body: !loaded ? CircularProgressIndicator (
        backgroundColor: Theme.of(context).primaryColor,
      ) : GridView.builder(
        itemCount: cardsCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Orientation == Orientation.portrait ? 3 : 2),
          itemBuilder: (context, index) => buildCards(context, index)),
    );
  }

  void updateAll() async 
  {
    List<DB.Word> finalWords = List<DB.Word>();
    List<int> wordsID = List<int>();
    int randomNum; 
    var rand = Random();
    var topics = await topicsDao.getAllTopics();
    DB.Topic randomTopic = topics.elementAt(rand.nextInt(topics.length -1));
    var words = await wordsDao.getByTopic(randomTopic.id);
    if (words.length > cardsCount / 2) 
    {
      for (int i = 0; i < cardsCount / 2; i++)
      {
        while ( !wordsID.contains(randomNum) )
          randomNum = rand.nextInt(words.length-1);
        finalWords.add(words.elementAt(randomNum));
        wordsID.add(randomNum);
      }
    } else finalWords.addAll(words);
    wordsID = List<int>();
    int allCount = (finalWords.length / 2).toInt();
    for(int i =0; i < finalWords.length; i++) 
    {
      while ( !wordsID.contains(randomNum) )
          randomNum = rand.nextInt( allCount );
      finalWords.add(finalWords.elementAt(randomNum));
      wordsID.add(randomNum);
    }
    setState(()
    {
      tempTopic = randomTopic;
      tempWords = finalWords;
      loaded = true;
    });
  }

  void select(int index) {
    if (!done.contains(index) && !error.contains(index)) {
      if (selected != -1)
        selected = index;
      else {
        if ( tempWords.elementAt(selected).id == tempWords.elementAt(index).id) {
          setState(() {
            done.add(selected);
            done.add(index);
            selected = -1;
          });
        } else {
          setState(() {
            error.add(selected);
            error.add(index);
            selected = -1;
          });
        }
      }
    }
  }

  Widget buildCards(BuildContext context, int index) {
    return GestureDetector (
      onTap: () => select(index),
      child: Card(
        color: done.contains(index) ? Colors.green : error.contains(index) ? Colors.redAccent : selected == index ? Colors.yellow : Colors.white,
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(tempWords == null ? 'Loading' : tempWords.elementAt(index)),
            Spacer()
          ],
        ),
      )
    );
  }
}
