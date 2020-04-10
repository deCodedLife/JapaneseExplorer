import 'dart:io';
import '../Data/UserDB.dart' as DB;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TopicPage extends StatefulWidget {
  final String topicData;
  TopicPage({
    Key key,
    @required this.topicData,
  }) : super(key: key);
  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  String topicName = 'New topic';
  File imageFile;
  int imageID;
  String description;

  @override
  Widget build(BuildContext context) {
    final topicsDao = Provider.of<DB.TopicDao>(context);
    final imageDao = Provider.of<DB.ImageDao>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicData != '' ? widget.topicData : '$topicName'),
      ),
      body: ListView(
        children: [
          //imageLayer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Topic name'),
                  onChanged: (String text) {
                    setState(() {
                      topicName = text;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Discription'),
                  onChanged: (String text) {
                    setState(() {
                      description = text;
                    });
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: [
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Future imageFunc = insertImage(imageFile, imageDao);
                          imageFunc.then((req) {
                            if (imageID != null) {
                              topicsDao.addTopic(DB.Topic(
                                name: topicName,
                                description: description,
                              ));
                            }
                          });
                        },
                        child: const Text('Sumbit'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> insertImage(File image, DB.ImageDao imageDao) async {
    imageID = await imageDao.addImage(DB.Image(
      path: imageFile.path,
    ));
  }

  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
    });
  }

  Widget imageLayer() {
    if (imageFile != null)
      return GestureDetector(
        onTap: () => getImage(),
        child:
            Image.file(imageFile, width: 500, height: 300, fit: BoxFit.cover),
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
}
