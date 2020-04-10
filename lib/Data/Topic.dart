import 'Card.dart';

class Topic {
  final String image;
  final String name;
  final String description;
  final List<CardData> words;
  
  Topic(this.image, this.name, this.description, this.words);
}