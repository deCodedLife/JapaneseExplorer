import 'package:flutter/material.dart';

class CulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese culture'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Culture Page',
              style: TextStyle(fontSize: 62),
              ),
          ],
        ),
      ),
    );
  }
}