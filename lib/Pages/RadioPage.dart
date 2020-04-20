import 'package:flutter/material.dart';
import '../Data/StaticRadio.dart';
import 'package:http/http.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import '../Core/AudioPlayer.dart';
import 'package:path_provider/path_provider.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  String localFilePath;

  Future _loadFile(String url) async {
    final bytes = await readBytes(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      setState(() {
        localFilePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese radio'),
      ),
      body: ListView.builder(
        itemCount: radioAPI.length,
        itemBuilder: (context, index) => buildList(context, index),
      )
    );
  }
  Widget buildList(BuildContext context, int index) {
    return ListTile (
      leading: radioAPI.elementAt(index).initIcon,
      title: radioAPI.elementAt(index).title,
      subtitle: radioAPI.elementAt(index).description,
      onTap: () {
        audioPlayer.play(radioAPI.elementAt(index).link);
      },
    );
  }
}