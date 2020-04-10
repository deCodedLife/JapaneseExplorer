import 'dart:io';

class Boxes {
  final String optionsBox;
  final String apiBox;
  final String imagesBox;
  final String soundsBox;
  final String videosBox;
  final String wordsBox;
  final String topicsBox;

  Boxes(
    this.optionsBox, 
    this.apiBox, 
    this.imagesBox,
    this.soundsBox,
    this.videosBox,
    this.topicsBox,
    this.wordsBox
    );
}

class Database {
  bool initialized = false;
  final allDatabases = Boxes (
    'Options',
    'Api',
    'Images',
    'Sounds',
    'Videos',
    'Topics',
    'Words'
  );

  void initDatabase( Directory appDocsDir ) {
    if (!initialized) {
      initialized = !initialized;
    }
  }

  Boxes getBoxesNames () {
    return  allDatabases;
  }

}