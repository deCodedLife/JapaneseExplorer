import 'package:flutter/material.dart';

class DataItem {
  final Text title;
  final Text description;
  final Icon initIcon;
  final IconButton options;
  DataItem(this.title, this.description, this.initIcon, this.options);
}

List<DataItem> optionsList = [
  DataItem(
    Text('Language'),
    Text(
      'Change language',
      style: TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.grey
        )
      ),
    Icon(Icons.language),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ),
  DataItem(
    Text('Theme'),
    Text(
      'Choose your theme',
      style: TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.grey
        )
      ),
    Icon(Icons.style),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ),
];

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: ListView.builder(
        itemCount: optionsList.length,
        itemBuilder: (context, index) => buildList(context, index)
        ),
    );
  }
  Widget buildList(BuildContext context, int index) {
    return ListTile(
      leading: optionsList.elementAt(index).initIcon,
      title: optionsList.elementAt(index).title,
      subtitle: optionsList.elementAt(index).description,
      trailing: optionsList.elementAt(index).options,
    );
  }
}