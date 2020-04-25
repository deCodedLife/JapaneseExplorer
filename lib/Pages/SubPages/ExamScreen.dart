import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  List<DB.Topic> topics = List<DB.Topic>();
  List<DB.Word> words = List<DB.Word>();
  DB.Word tempWord;
  DB.Image tempImage;
  DB.Sound tempSound;

  @override
  Widget build(BuildContext context) {
    if (topicsDao != null) 
    {
      var task = topicsDao.getAllTopics();
      task.then((request) => topics = request);
    }
    topicsDao = Provider.of<DB.TopicDao>(context);
    wordsDao = Provider.of<DB.WordDao>(context);
    imagesDao = Provider.of<DB.ImageDao>(context);
    soundsDao = Provider.of<DB.SoundDao>(context);
    _init();
    return Scaffold(
      appBar: AppBar(
        title: Text('Test your skils'),
      ),
      body: buildMain(),
    );
  }

  _init() 
  {
    var random = Random();
    int randomTopic = random.nextInt(topics.length - 1);
    var topicTask = wordsDao.getByTopic(topics[randomTopic].id);
    topicTask.then(
      (request) {
        var randomWord = request.elementAt(random.nextInt(request.length - 1));
        var imageTask = imagesDao.getByID(randomWord.id);
        imageTask.then(
          (image) {
            var soundTask = soundsDao.getByID(randomWord.sound);
            soundTask.then(
              (sound) {
                setState(() {
                  tempWord = randomWord;
                  tempImage = image;
                  tempSound = sound;
                });
              }
            );
          } 
        );
      });
  }

  Widget buildMain() {
    if (Orientation == Orientation.portrait)
    return Column (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(),
        ),
        SizedBox(height: 16.0,),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter translation',
                  errorText: 'Cant be empty',
                  hoverColor: Theme.of(context).primaryColor
                ),
              ),
              MaterialButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Sumbit'),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
    else 
    return Row (

    );
  }
}