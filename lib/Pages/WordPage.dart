import 'package:flutter/material.dart';
import 'package:japanese_explorer/Data/Card.dart';

class WordPage extends StatelessWidget {
  final CardData data;
  WordPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word ' + data.word),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Word Page',
              style: TextStyle(fontSize: 62),
              ),
          ],
        ),
      ),
    );
  }
}