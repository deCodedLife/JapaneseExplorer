import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SubPages/CompareScreen.dart';
import 'SubPages/ExamScreen.dart';
import '../Data/UserDB.dart';

BuildContext globalContext;

class StudyPage extends StatefulWidget {
  @override
  _StudyPage createState() => _StudyPage();
}

class _StudyPage extends State<StudyPage> {
   

  List<ListTile> data = [
    ListTile(
      leading: Icon(Icons.border_all),
      title: Text('Comparing'),
      subtitle: Text(
        'Learning by chosing words',
        style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      ),
      onTap: () {
        Navigator.push(
          globalContext, 
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                Provider(create: (_) => UserDatabase().topicDao),
                Provider(create: (_) => UserDatabase().wordDao),
                Provider(create: (_) => UserDatabase().soundDao),
                Provider(create: (_) => UserDatabase().imageDao)                
              ],
              child: CompareScreen(),
            )
          )
        );
      },
    ),
    ListTile(
      leading: Icon(Icons.school),
      title: Text('Exam'),
      subtitle: Text(
        'Write correct word',
        style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      ),
      onTap: () => Navigator.push(
          globalContext, 
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                Provider(create: (_) => UserDatabase().topicDao),
                Provider(create: (_) => UserDatabase().wordDao),
                Provider(create: (_) => UserDatabase().soundDao),
                Provider(create: (_) => UserDatabase().imageDao)                
              ],
              child: ExamScreen(),
            )
          )
        )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning new words'),
      ),
      body: ListView.builder(
        itemCount: data.length, 
        itemBuilder: (context, index) => buildList(context, index)
        ),
    );
  }
  Widget buildList(BuildContext context, int index) {
    return data.elementAt(index);
  }
}
