import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/UserDB.dart' as DB;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class Data {
  final List<DB.Word> words;
  final DB.WordDao wordsDao;
  final DB.ImageDao imagesDao;
  final DB.SoundDao soundsDao;
  List<String> images = List<String>();
  List<String> sounds = List<String>();
  final DB.Topic topic;
  Data(this.words, this.wordsDao, this.imagesDao, this.soundsDao, this.images,
      this.sounds, this.topic);
}

class Fuck {
  List<String> images;
  List<String> sounds;
  Fuck(this.images, this.sounds);
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
  DB.ImageDao imagesDao;
  DB.SoundDao soundsDao;
  List<String> images = List<String>();
  List<String> sounds = List<String>();
  bool block = false;
  bool deny = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainView(
              allData: Data(words, wordsDao, imagesDao, soundsDao, images,
                  sounds, widget.topic),
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordDao = Provider.of<DB.WordDao>(context);
    final imageDao = Provider.of<DB.ImageDao>(context);
    final soundDao = Provider.of<DB.SoundDao>(context);
    load(wordDao, imageDao, soundDao);
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

  Future<Fuck> initAll(
      List<DB.Word> words, DB.ImageDao imageDao, DB.SoundDao soundDao) async {
    List<String> temp1 = List<String>();
    List<String> temp2 = List<String>();
    for (int i = 0; i < words.length; i++) {
      var word = words.elementAt(i);
      var image = await imageDao.getByID(word.image);
      var sound = await soundDao.getByID(word.sound);
      temp1.add(image.path);
      temp2.add(sound.path);
    }
    return Fuck(temp1, temp2);
  }

  void load(
      DB.WordDao wordDao, DB.ImageDao imageDao, DB.SoundDao soundDao) async {
    if (words.length == 0 && !block) {
      var _words = wordDao.getByTopic(widget.topic.id);
      _words.then((allWords) {
        initAll(allWords, imageDao, soundDao).then((data) => setState(() {
              wordsDao = wordDao;
              imagesDao = imageDao;
              soundsDao = soundDao;
              images = data.images;
              sounds = data.sounds;
              words = allWords;
              print("Pizda: " + words.toString());
              if (words.length == 0 || words.length == 1) block = true;
            }));
      });
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
  List<String> tempImages = List<String>();
  List<DB.Word> words = List<DB.Word>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    if (words.length == 0) words = widget.allData.words;
    setState(() {
      for (int i = 0; i < words.length; i++) temp.add(words.elementAt(i).word);
      for (int i = 0; i < widget.allData.images.length; i++)
        tempImages.add(widget.allData.images.elementAt(i));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Words of ' + widget.allData.topic.name),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: () => refreshpage(
            widget.allData.wordsDao,
          ),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Orientation == Orientation.portrait ? 3 : 2),
              itemCount: words.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildCard(context, index)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) =>
                WordsDialog(allData: widget.allData)),
        tooltip: 'Add card',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Null> refreshpage(DB.WordDao wordsDao) async {
    refreshKey.currentState?.show();
    var _topics = wordsDao.getByTopic(widget.allData.topic.id);
    _topics.then((req) {
      setState(() {
        words = req;
      });
    });
    await Future.delayed(Duration(seconds: 3));
    return null;
  }

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
            )),
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

class WordsDialog extends StatefulWidget {
  final Data allData;
  WordsDialog({
    Key key,
    @required this.allData,
  }) : super(key: key);
  @override
  _WordsDialogState createState() => _WordsDialogState();
}

class _WordsDialogState extends State<WordsDialog> {
  String localImage;
  String localSound;
  String word;
  String translate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'New word',
        style: TextStyle(fontSize: 24, color: Colors.purpleAccent),
      ),
      content: new SingleChildScrollView(
          child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            imageLayer(),
            soundLayer(),
            new TextFormField(
              decoration: InputDecoration(
                  labelText: 'Word *', hintText: 'Enter new word'),
              onChanged: (String text) {
                setState(() {
                  word = text;
                });
              },
            ),
            new TextFormField(
              decoration: InputDecoration(
                  labelText: 'Translate *', hintText: 'Enter your translation'),
              onChanged: (String text) {
                setState(() {
                  translate = text;
                });
              },
            ),
          ])),
      actions: <Widget>[
        MaterialButton(
          textColor: Colors.purpleAccent,
          child: Text('submit'),
          onPressed: () {
            if (localImage != null && word.length > 0 && translate.length > 0) {
              Navigator.pop(context);
              var wordsDao = widget.allData.wordsDao;
              var imageDao = widget.allData.imagesDao;
              var soundDao = widget.allData.soundsDao;

              var addImage =
                  imageDao.addImage(DB.Image(id: null, path: localImage));

              addImage.then((imageID) {
                var addSound = soundDao.addSound(
                    DB.Sound(id: null, link: 'null', path: localSound));

                addSound.then((soundID) {
                  var addWord = wordsDao.addWord(DB.Word(
                    id: null,
                    word: word,
                    image: imageID,
                    sound: soundID,
                    translate: translate,
                    topic: widget.allData.topic.id,
                    practise: 0,
                  ));
                });
              });
            }
          },
        )
      ],
    );
  }

  Widget imageLayer() {
    if (localImage != null)
      return GestureDetector(
        onTap: () => getImage(),
        child: Image.file(File(localImage),
            width: 500, height: 300, fit: BoxFit.cover),
      );
    else
      return GestureDetector(
          onTap: () => getImage(),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text('Select Image'),
                ))
          ]));
  }

  Widget soundLayer() {
    if (localSound != null)
      return GestureDetector(
        onTap: () => getImage(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(localSound),
        ),
      );
    else
      return GestureDetector(
          onTap: () => getSound(),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text('Select Sound'),
                ))
          ]));
  }

  getSound() async {
    var sound = await FilePicker.getFilePath(type: FileType.audio);
    setState(() {
      localSound = sound;
    });
  }

  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) localImage = image.path;
    });
  }
}

class AudioPicker {
  static const MethodChannel _channel = const MethodChannel('audio_picker');

  static Future<String> pickAudio() async {
    final String absolutePath = await _channel.invokeMethod('pick_audio');
    return absolutePath;
  }
}
