import 'package:flutter/material.dart';

class StudyPage extends StatelessWidget {
  final String data;
  StudyPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning words'),
      ),
      body: GestureDetector (
        onPanUpdate: (details){
          if (details.delta.dx > 0) Navigator.pop(context);
          else if (details.delta.dy > 0) Navigator.of(context).pushNamed('/Video');
        },
        child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 62),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      )
    );
  }
}