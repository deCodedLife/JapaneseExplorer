import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'UserDB.g.dart';

class Images extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get path => text().withLength(min: 1, max: 512)();
  @override
  Set<Column> get primaryKey => {id};
}

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().withLength(min: 1, max: 255)();
  @override
  Set<Column> get primaryKey => {id};
}

class Sounds extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get link => text().withLength(min: 1, max: 512)();
  TextColumn get path => text().withLength(min: 1, max: 255)();
  @override
  Set<Column> get primaryKey => {id};
}

class Videos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wathed => integer()();
  IntColumn get finished => integer()();
  TextColumn get link => text().withLength(min: 1, max: 512)();
  @override
  Set<Column> get primaryKey => {id};
}

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get topic => integer().nullable().customConstraint(
    'NULL REFERENCES Topics(id)')();
  IntColumn get image => integer().nullable().customConstraint(
    'NULL REFERENCES Images(id)')();
  IntColumn get sound => integer().nullable().customConstraint(
    'NULL REFERENCES Sounds(id)')();
  IntColumn get practise => integer()();
  TextColumn get word => text().withLength(min: 1, max: 255)();
  TextColumn get translate => text().withLength(min: 1, max: 255)();
  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Images, Topics, Sounds, Videos, Words], daos: [TopicDao, WordDao, SoundDao, VideoDao, ImageDao])
class UserDatabase extends _$UserDatabase {
  UserDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'userdata.bin',
          logStatements: true,
        ));
  @override
  int get schemaVersion => 2;
}

@UseDao(tables: [Images])
class ImageDao extends DatabaseAccessor<UserDatabase> with _$ImageDaoMixin {
  UserDatabase db;
  ImageDao(this.db) : super(db);
  Future<List<Image>> getAllImages() => select(images).get();
  Stream<List<Image>> watchAllImages() => select(images).watch();
  Future insertImages(Image image) => into(images).insert(image);
  Future updateImages(Image image) => update(images).replace(image);
  Future deleteImages(Image image) => delete(images).delete(image);
  Stream <Image> watchByID(int id) {
    return (select(images)
      ..where(
        (t) => t.id.equals(id)
      )).watchSingle();
  } 
  Future <Image> getByID(int id) {
    return (select(images)
      ..where(
        (t) => t.id.equals(id)
      )).getSingle();
  } 
  Future<int> addImage(Image image) {
    return into(images).insert(image);
  }
}

@UseDao(tables: [Sounds])
class SoundDao extends DatabaseAccessor<UserDatabase> with _$SoundDaoMixin {
  final UserDatabase db;
  SoundDao(this.db) : super(db);
  Future<List<Sound>> getAllSounds() => select(sounds).get();
  Stream<List<Sound>> watchAllSounds() => select(sounds).watch();
  Future insertSounds(Insertable<Sound> sound) => into(sounds).insert(sound);
  Future updateSounds(Insertable<Sound> sound) => update(sounds).replace(sound);
  Future deleteSounds(Insertable<Sound> sound) => delete(sounds).delete(sound);
  Future<int> addSound(Sound sound) {
    return into(sounds).insert(sound);
  }
  Future <Sound> getByID(int id) {
    return (select(sounds)
      ..where(
        (t) => t.id.equals(id)
      )).getSingle();
  } 
}

@UseDao(tables: [Videos])
class VideoDao extends DatabaseAccessor<UserDatabase>with _$VideoDaoMixin {
  final UserDatabase db;
  VideoDao(this.db) : super(db);
  Future<List<Video>> getAllVideos() => select(videos).get();
  Stream<List<Video>> watchAllVideos() => select(videos).watch();
  Future insertVideos(Video video) => into(videos).insert(video);
  Future updateVideos(Video video) => update(videos).replace(video);
  Future deleteVideos(Video video) => delete(videos).delete(video);
}

@UseDao(tables: [Topics, Images])
class TopicDao extends DatabaseAccessor<UserDatabase> with _$TopicDaoMixin {
  final UserDatabase db;
  TopicDao(this.db) : super(db);
  Future<List<Topic>> getAllTopics() => select(topics).get();
  Stream<List<Topic>> watchAllTopics() => select(topics).watch();
  Future insertTopics(Insertable<Topic> topic) => into(topics).insert(topic);
  Future updateTopics(Insertable<Topic> topic) => update(topics).replace(topic);
  Future deleteTopics(Insertable<Topic> topic) => delete(topics).delete(topic);
  Future<int> addTopic(Topic topic) {
    return into(topics).insert(topic);
  }
}

@UseDao(tables: [Words, Topics, Images, Sounds])
class WordDao extends DatabaseAccessor<UserDatabase> with _$WordDaoMixin {
  final UserDatabase db;
  WordDao(this.db) : super(db);

  Future <List<Word>> getByTopic(int topic) {
    return (select(words)
    ..where(
    (t) => t.topic.equals(topic)
    )).get();
  } 

  Future<List<Word>> getAllWords() => select(words).get();
  Stream<List<Word>> watchAllWords() => select(words).watch();
  Future insertWords(Insertable<Word> word) => into(words).insert(word);
  Future updateWords(Insertable<Word> word) => update(words).replace(word);
  Future deleteWords(Insertable<Word> word) => delete(words).delete(word);
  Future<int> addWord(Word word) {
    return into(words).insert(word);
  }
}