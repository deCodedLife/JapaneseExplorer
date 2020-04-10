import 'package:flutter/material.dart';

class RadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese radio'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Radio page',
              style: TextStyle(fontSize: 62),
              ),
          ],
        ),
      ),
    );
  }
}