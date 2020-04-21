import 'package:flutter/material.dart';
import '../Data/StaticRadio.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  String localFilePath;

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