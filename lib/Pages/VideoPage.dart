import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese videos'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Videos page',
              style: TextStyle(fontSize: 62),
              ),
          ],
        ),
      ),
    );
  }
}