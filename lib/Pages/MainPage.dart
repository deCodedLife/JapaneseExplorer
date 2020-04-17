import 'package:flutter/material.dart';

MaterialColor _theme = Colors.purple;

class JapaneseExplorer extends StatelessWidget {
  final List<String> cards = ['Recent','Update','Options'];

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: _theme,
          buttonColor: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )
      ),
      title: 'Japanese Explorer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Japanese explorer'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) =>buildCard(context, index),
        ),
      ),
    );
    return materialApp;
  }
  Widget buildCard(BuildContext context, int index) {
      return Card(
        elevation: 2,
        child: Container(
          child: GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Icon(
                    index == 0 ? Icons.history :
                    index == 1 ? Icons.cloud_download :
                    Icons.settings,
                    size: 42.0,
                  ),
                  Spacer(),
                  Text(
                    cards.elementAt(index),
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
}
