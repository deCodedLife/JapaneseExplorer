import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../Data/UserDB.dart' as DB;

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  DB.TopicDao topicsDao;
  DB.WordDao wordsDao;
  DB.ImageDao imagesDao;
  DB.SoundDao soundsDao;

  List<DB.Topic> tempTopics = List<DB.Topic>();
  List<DB.Topic> topics = List<DB.Topic>();
  List<DB.Word> words = List<DB.Word>();
  DB.Word tempWord;
  DB.Image tempImage;
  DB.Sound tempSound;
  int state = 0;
  bool loaded = false;
  bool tempLoaded = false;
  String userInput;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    topicsDao = Provider.of<DB.TopicDao>(context);
    wordsDao = Provider.of<DB.WordDao>(context);
    imagesDao = Provider.of<DB.ImageDao>(context);
    soundsDao = Provider.of<DB.SoundDao>(context);
    if (!loaded) {
      var getTopics = topicsDao.getAllTopics();
      getTopics.then((temp) {
        setState(() {
          tempTopics = temp;
          loaded = true;
        });
      });
    } else if (state == 0 && loaded) _init();
    return Scaffold(
      appBar: AppBar(
        title: Text('Test your skils'),
      ),
      body: buildMain(),
    );
  }

  _execute() {
    var random = Random();
    int randomTopic;
    if (tempTopics.length > 1)
      randomTopic = random.nextInt(tempTopics.length - 1);
    else
      randomTopic = 0;
    var topicTask = wordsDao.getByTopic(tempTopics[randomTopic].id);
    topicTask.then((request) {
      var randomWord = request.elementAt(random.nextInt(request.length - 1));
      var imageTask = imagesDao.getByID(randomWord.id);
      imageTask.then((image) {
        var soundTask = soundsDao.getByID(randomWord.sound);
        soundTask.then((sound) {
          setState(() {
            tempWord = randomWord;
            tempImage = image;
            tempSound = sound;
            print('eee boy');
          });
        });
      });
    });
  }

  _init() {
    if (topics.length == 0 && loaded) {
      var task = topicsDao.getAllTopics();
      task.then((request) {
        setState(() {
          tempLoaded = true;
          topics = request;
          loaded = true;
          _execute();
        });
      });
    } else if (!tempLoaded) {
      tempLoaded = true;
      _execute();
    }
  }

  Widget buildMain() {
    if (Orientation != Orientation.portrait)
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(16.0), child: cardView(context)),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(16.0), child: inputView(context))),
        ],
      ));
    else
      return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16.0), child: cardView(context)),
          Padding(padding: EdgeInsets.all(16.0), child: inputView(context))
        ],
      );
  }

  Widget cardView(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              audioPlayer.play(tempSound.path);
            },
            child: Card(child: Center(child: showContent()))));
  }

  Widget inputView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          onChanged: (text) {
            if (text.length != 0) userInput = text;
          },
          decoration: InputDecoration(
              labelText: 'Enter translation',
              hoverColor: Theme.of(context).primaryColor),
        ),
        Spacer(),
        MaterialButton(
          textColor: Theme.of(context).primaryColor,
          child: Text('Sumbit'),
          onPressed: () {
            if (userInput.length != 0) {
              print(tempWord.translate + "\n" + userInput);
              if (tempWord.translate == userInput) {
                setState(() {
                  state = 1;
                  print('hell yeah');
                });
                Future.delayed(Duration(seconds: 3), () {
                    setState(() {
                      state = 0;
                      tempLoaded = false;
                    });
                  });
              }
            }
          },
        )
      ],
    );
  }

  Widget showContent() {
    if (state == 0)
      return Column(children: <Widget>[
        Spacer(),
        Text(tempWord == null ? 'Loading' : tempWord.word,
            style: TextStyle(
              fontSize: 32,
            ),
            textAlign: TextAlign.center),
        Spacer()
      ]);
    else if (state == 1)
      return Icon(Icons.done, color: Colors.greenAccent, size: 64.0);
    else
      return Icon(Icons.clear, color: Colors.redAccent, size: 64.0);
  }
}
