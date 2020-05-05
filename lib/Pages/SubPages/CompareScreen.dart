import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../Data/UserDB.dart' as DB;

const cardsCount = 6; // PLEASE DON'T CHANGE IT!!!!!!!!!!!

class CompareScreen extends StatefulWidget {
  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  DB.TopicDao topicsDao;
  DB.WordDao wordsDao;
  DB.Topic tempTopic;

  int selected = -1;
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
    if (!loaded) Future.delayed(Duration(seconds: 1), () => updateAll());
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare game'),
      ),
      body: !loaded
          ? Center(
              child: Column(children: <Widget>[
              Spacer(),
              CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                semanticsValue: '15',
                value: 40.0,
                semanticsLabel: 'Loading',
              ),
              Spacer()
            ]))
          : GridView.builder(
              itemCount: cardsCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getSize()),
              itemBuilder: (context, index) => buildCards(context, index)),
    );
  }

  getSize() {
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return 4;
    else
      return 3;
  }

  void updateAll() async {
    List<DB.Word> finalWords = List<DB.Word>();
    List<int> wordsID = [-1];
    int randomNum = 0;
    var rand = new Random();
    DB.Topic randomTopic;
    var topics = await topicsDao.getAllTopics();
    if (topics.length > 1)
      randomTopic = topics.elementAt(rand.nextInt(topics.length - 1));
    else
      randomTopic = topics.elementAt(0);
    var words = await wordsDao.getByTopic(randomTopic.id);
    if (words.length > cardsCount / 2) {
      for (int i = 0; i < cardsCount / 2; i++) {
        while (true) {
          randomNum = rand.nextInt(words.length);
          if (!wordsID.contains(randomNum)) break;
        }
        finalWords.add(words.elementAt(randomNum));
        wordsID.add(randomNum);
      }
    } else
      finalWords.addAll(words);
    wordsID = [-1];
    int temp = finalWords.length;
    if (finalWords.length > 1) {
      for (int i = 0; i < temp; i++) {
        while (true) {
          randomNum = rand.nextInt(temp);
          if (!wordsID.contains(randomNum)) break;
        }
        finalWords.add(finalWords.elementAt(randomNum));
        wordsID.add(randomNum);
      }
    } else
      finalWords.add(finalWords.elementAt(0));
    setState(() {
      tempTopic = randomTopic;
      tempWords = finalWords;
      loaded = true;
    });
  }

  void select(int index) {
    if (!done.contains(index) && !error.contains(index)) {
      if (selected == -1)
        setState(() {
          selected = index;
        });
      else {
        var current = tempWords.elementAt(index);
        var choosen = tempWords.elementAt(selected);
        if (choosen.id == current.id) {
          setState(() {
            done.add(selected);
            done.add(index);
            selected = -1;
          });
        } else {
          setState(() {
            error.add(selected);
            error.add(index);
            error.add(getCurrentWord(current.id, index));
            error.add(getCurrentWord(choosen.id, selected));
            selected = -1;
          });
        }
      }
    }
    List<int> fine = new List<int>();
    for (int i = 0; i < tempWords.length; i++) {
      if (done.contains(i)) fine.add(i);
      if (error.contains(i)) fine.add(i);
    }
    if (fine.length == tempWords.length) {
      selected = -1;
      done.clear();
      error.clear();
      done = List<int>();
      error = List<int>();
      setState(() {
        loaded = false;
      });
    }
  }

  getCurrentWord(int wordID, int deny) {
    for (int i = 0; i < tempWords.length; i++)
      if (tempWords.elementAt(i).id == wordID && i != deny) return i;
    return 0;
  }

  Widget buildCards(BuildContext context, int index) {
    if (tempWords.length > index) {
      return GestureDetector(
          onTap: () {
            if (!error.contains(index)) {
              select(index);
            }
          },
          child: Card(
            color: done.contains(index)
                ? Colors.green
                : error.contains(index)
                    ? Colors.redAccent
                    : selected == index ? Colors.yellow : Colors.white,
            child: Column(
              children: <Widget>[
                Spacer(),
                Text(
                    tempWords == null
                        ? 'Loading'
                        : index < tempWords.length / 2
                            ? tempWords.elementAt(index).word
                            : tempWords.elementAt(index).translate,
                    style: TextStyle(fontSize: 32)),
                Spacer()
              ],
            ),
          ));
    } else {
      return Container();
    }
  }
}
