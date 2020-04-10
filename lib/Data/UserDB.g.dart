// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDB.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Image extends DataClass implements Insertable<Image> {
  final int id;
  final String path;
  Image({@required this.id, @required this.path});
  factory Image.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Image(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      path: stringType.mapFromDatabaseResponse(data['${effectivePrefix}path']),
    );
  }
  factory Image.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Image(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
    };
  }

  @override
  ImagesCompanion createCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
    );
  }

  Image copyWith({int id, String path}) => Image(
        id: id ?? this.id,
        path: path ?? this.path,
      );
  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('id: $id, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, path.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Image && other.id == this.id && other.path == this.path);
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<int> id;
  final Value<String> path;
  const ImagesCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.id = const Value.absent(),
    @required String path,
  }) : path = Value(path);
  ImagesCompanion copyWith({Value<int> id, Value<String> path}) {
    return ImagesCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
    );
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, Image> {
  final GeneratedDatabase _db;
  final String _alias;
  $ImagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _pathMeta = const VerificationMeta('path');
  GeneratedTextColumn _path;
  @override
  GeneratedTextColumn get path => _path ??= _constructPath();
  GeneratedTextColumn _constructPath() {
    return GeneratedTextColumn('path', $tableName, false,
        minTextLength: 1, maxTextLength: 512);
  }

  @override
  List<GeneratedColumn> get $columns => [id, path];
  @override
  $ImagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'images';
  @override
  final String actualTableName = 'images';
  @override
  VerificationContext validateIntegrity(ImagesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.path.present) {
      context.handle(
          _pathMeta, path.isAcceptableValue(d.path.value, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Image map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Image.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ImagesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.path.present) {
      map['path'] = Variable<String, StringType>(d.path.value);
    }
    return map;
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(_db, alias);
  }
}

class Topic extends DataClass implements Insertable<Topic> {
  final int id;
  final String name;
  final String description;
  Topic({@required this.id, @required this.name, @required this.description});
  factory Topic.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Topic(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  factory Topic.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  @override
  TopicsCompanion createCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  Topic copyWith({int id, String name, String description}) => Topic(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, description.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  TopicsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
  })  : name = Value(name),
        description = Value(description);
  TopicsCompanion copyWith(
      {Value<int> id, Value<String> name, Value<String> description}) {
    return TopicsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

class $TopicsTable extends Topics with TableInfo<$TopicsTable, Topic> {
  final GeneratedDatabase _db;
  final String _alias;
  $TopicsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  $TopicsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'topics';
  @override
  final String actualTableName = 'topics';
  @override
  VerificationContext validateIntegrity(TopicsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Topic map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Topic.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TopicsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    return map;
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(_db, alias);
  }
}

class Sound extends DataClass implements Insertable<Sound> {
  final int id;
  final String link;
  final String path;
  Sound({@required this.id, @required this.link, @required this.path});
  factory Sound.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Sound(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      link: stringType.mapFromDatabaseResponse(data['${effectivePrefix}link']),
      path: stringType.mapFromDatabaseResponse(data['${effectivePrefix}path']),
    );
  }
  factory Sound.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Sound(
      id: serializer.fromJson<int>(json['id']),
      link: serializer.fromJson<String>(json['link']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'link': serializer.toJson<String>(link),
      'path': serializer.toJson<String>(path),
    };
  }

  @override
  SoundsCompanion createCompanion(bool nullToAbsent) {
    return SoundsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
    );
  }

  Sound copyWith({int id, String link, String path}) => Sound(
        id: id ?? this.id,
        link: link ?? this.link,
        path: path ?? this.path,
      );
  @override
  String toString() {
    return (StringBuffer('Sound(')
          ..write('id: $id, ')
          ..write('link: $link, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(link.hashCode, path.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Sound &&
          other.id == this.id &&
          other.link == this.link &&
          other.path == this.path);
}

class SoundsCompanion extends UpdateCompanion<Sound> {
  final Value<int> id;
  final Value<String> link;
  final Value<String> path;
  const SoundsCompanion({
    this.id = const Value.absent(),
    this.link = const Value.absent(),
    this.path = const Value.absent(),
  });
  SoundsCompanion.insert({
    this.id = const Value.absent(),
    @required String link,
    @required String path,
  })  : link = Value(link),
        path = Value(path);
  SoundsCompanion copyWith(
      {Value<int> id, Value<String> link, Value<String> path}) {
    return SoundsCompanion(
      id: id ?? this.id,
      link: link ?? this.link,
      path: path ?? this.path,
    );
  }
}

class $SoundsTable extends Sounds with TableInfo<$SoundsTable, Sound> {
  final GeneratedDatabase _db;
  final String _alias;
  $SoundsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _linkMeta = const VerificationMeta('link');
  GeneratedTextColumn _link;
  @override
  GeneratedTextColumn get link => _link ??= _constructLink();
  GeneratedTextColumn _constructLink() {
    return GeneratedTextColumn('link', $tableName, false,
        minTextLength: 1, maxTextLength: 512);
  }

  final VerificationMeta _pathMeta = const VerificationMeta('path');
  GeneratedTextColumn _path;
  @override
  GeneratedTextColumn get path => _path ??= _constructPath();
  GeneratedTextColumn _constructPath() {
    return GeneratedTextColumn('path', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  @override
  List<GeneratedColumn> get $columns => [id, link, path];
  @override
  $SoundsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sounds';
  @override
  final String actualTableName = 'sounds';
  @override
  VerificationContext validateIntegrity(SoundsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.link.present) {
      context.handle(
          _linkMeta, link.isAcceptableValue(d.link.value, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (d.path.present) {
      context.handle(
          _pathMeta, path.isAcceptableValue(d.path.value, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sound map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Sound.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SoundsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.link.present) {
      map['link'] = Variable<String, StringType>(d.link.value);
    }
    if (d.path.present) {
      map['path'] = Variable<String, StringType>(d.path.value);
    }
    return map;
  }

  @override
  $SoundsTable createAlias(String alias) {
    return $SoundsTable(_db, alias);
  }
}

class Video extends DataClass implements Insertable<Video> {
  final int id;
  final int wathed;
  final int finished;
  final String link;
  Video(
      {@required this.id,
      @required this.wathed,
      @required this.finished,
      @required this.link});
  factory Video.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Video(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      wathed: intType.mapFromDatabaseResponse(data['${effectivePrefix}wathed']),
      finished:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}finished']),
      link: stringType.mapFromDatabaseResponse(data['${effectivePrefix}link']),
    );
  }
  factory Video.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Video(
      id: serializer.fromJson<int>(json['id']),
      wathed: serializer.fromJson<int>(json['wathed']),
      finished: serializer.fromJson<int>(json['finished']),
      link: serializer.fromJson<String>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wathed': serializer.toJson<int>(wathed),
      'finished': serializer.toJson<int>(finished),
      'link': serializer.toJson<String>(link),
    };
  }

  @override
  VideosCompanion createCompanion(bool nullToAbsent) {
    return VideosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      wathed:
          wathed == null && nullToAbsent ? const Value.absent() : Value(wathed),
      finished: finished == null && nullToAbsent
          ? const Value.absent()
          : Value(finished),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
    );
  }

  Video copyWith({int id, int wathed, int finished, String link}) => Video(
        id: id ?? this.id,
        wathed: wathed ?? this.wathed,
        finished: finished ?? this.finished,
        link: link ?? this.link,
      );
  @override
  String toString() {
    return (StringBuffer('Video(')
          ..write('id: $id, ')
          ..write('wathed: $wathed, ')
          ..write('finished: $finished, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(wathed.hashCode, $mrjc(finished.hashCode, link.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Video &&
          other.id == this.id &&
          other.wathed == this.wathed &&
          other.finished == this.finished &&
          other.link == this.link);
}

class VideosCompanion extends UpdateCompanion<Video> {
  final Value<int> id;
  final Value<int> wathed;
  final Value<int> finished;
  final Value<String> link;
  const VideosCompanion({
    this.id = const Value.absent(),
    this.wathed = const Value.absent(),
    this.finished = const Value.absent(),
    this.link = const Value.absent(),
  });
  VideosCompanion.insert({
    this.id = const Value.absent(),
    @required int wathed,
    @required int finished,
    @required String link,
  })  : wathed = Value(wathed),
        finished = Value(finished),
        link = Value(link);
  VideosCompanion copyWith(
      {Value<int> id,
      Value<int> wathed,
      Value<int> finished,
      Value<String> link}) {
    return VideosCompanion(
      id: id ?? this.id,
      wathed: wathed ?? this.wathed,
      finished: finished ?? this.finished,
      link: link ?? this.link,
    );
  }
}

class $VideosTable extends Videos with TableInfo<$VideosTable, Video> {
  final GeneratedDatabase _db;
  final String _alias;
  $VideosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _wathedMeta = const VerificationMeta('wathed');
  GeneratedIntColumn _wathed;
  @override
  GeneratedIntColumn get wathed => _wathed ??= _constructWathed();
  GeneratedIntColumn _constructWathed() {
    return GeneratedIntColumn(
      'wathed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _finishedMeta = const VerificationMeta('finished');
  GeneratedIntColumn _finished;
  @override
  GeneratedIntColumn get finished => _finished ??= _constructFinished();
  GeneratedIntColumn _constructFinished() {
    return GeneratedIntColumn(
      'finished',
      $tableName,
      false,
    );
  }

  final VerificationMeta _linkMeta = const VerificationMeta('link');
  GeneratedTextColumn _link;
  @override
  GeneratedTextColumn get link => _link ??= _constructLink();
  GeneratedTextColumn _constructLink() {
    return GeneratedTextColumn('link', $tableName, false,
        minTextLength: 1, maxTextLength: 512);
  }

  @override
  List<GeneratedColumn> get $columns => [id, wathed, finished, link];
  @override
  $VideosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'videos';
  @override
  final String actualTableName = 'videos';
  @override
  VerificationContext validateIntegrity(VideosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.wathed.present) {
      context.handle(
          _wathedMeta, wathed.isAcceptableValue(d.wathed.value, _wathedMeta));
    } else if (isInserting) {
      context.missing(_wathedMeta);
    }
    if (d.finished.present) {
      context.handle(_finishedMeta,
          finished.isAcceptableValue(d.finished.value, _finishedMeta));
    } else if (isInserting) {
      context.missing(_finishedMeta);
    }
    if (d.link.present) {
      context.handle(
          _linkMeta, link.isAcceptableValue(d.link.value, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Video map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Video.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(VideosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.wathed.present) {
      map['wathed'] = Variable<int, IntType>(d.wathed.value);
    }
    if (d.finished.present) {
      map['finished'] = Variable<int, IntType>(d.finished.value);
    }
    if (d.link.present) {
      map['link'] = Variable<String, StringType>(d.link.value);
    }
    return map;
  }

  @override
  $VideosTable createAlias(String alias) {
    return $VideosTable(_db, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final int topic;
  final int image;
  final int sound;
  final int practise;
  final String word;
  final String translate;
  Word(
      {@required this.id,
      this.topic,
      this.image,
      this.sound,
      @required this.practise,
      @required this.word,
      @required this.translate});
  factory Word.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Word(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      topic: intType.mapFromDatabaseResponse(data['${effectivePrefix}topic']),
      image: intType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      sound: intType.mapFromDatabaseResponse(data['${effectivePrefix}sound']),
      practise:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}practise']),
      word: stringType.mapFromDatabaseResponse(data['${effectivePrefix}word']),
      translate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}translate']),
    );
  }
  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      topic: serializer.fromJson<int>(json['topic']),
      image: serializer.fromJson<int>(json['image']),
      sound: serializer.fromJson<int>(json['sound']),
      practise: serializer.fromJson<int>(json['practise']),
      word: serializer.fromJson<String>(json['word']),
      translate: serializer.fromJson<String>(json['translate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'topic': serializer.toJson<int>(topic),
      'image': serializer.toJson<int>(image),
      'sound': serializer.toJson<int>(sound),
      'practise': serializer.toJson<int>(practise),
      'word': serializer.toJson<String>(word),
      'translate': serializer.toJson<String>(translate),
    };
  }

  @override
  WordsCompanion createCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      topic:
          topic == null && nullToAbsent ? const Value.absent() : Value(topic),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      sound:
          sound == null && nullToAbsent ? const Value.absent() : Value(sound),
      practise: practise == null && nullToAbsent
          ? const Value.absent()
          : Value(practise),
      word: word == null && nullToAbsent ? const Value.absent() : Value(word),
      translate: translate == null && nullToAbsent
          ? const Value.absent()
          : Value(translate),
    );
  }

  Word copyWith(
          {int id,
          int topic,
          int image,
          int sound,
          int practise,
          String word,
          String translate}) =>
      Word(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        image: image ?? this.image,
        sound: sound ?? this.sound,
        practise: practise ?? this.practise,
        word: word ?? this.word,
        translate: translate ?? this.translate,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('topic: $topic, ')
          ..write('image: $image, ')
          ..write('sound: $sound, ')
          ..write('practise: $practise, ')
          ..write('word: $word, ')
          ..write('translate: $translate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          topic.hashCode,
          $mrjc(
              image.hashCode,
              $mrjc(
                  sound.hashCode,
                  $mrjc(practise.hashCode,
                      $mrjc(word.hashCode, translate.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.topic == this.topic &&
          other.image == this.image &&
          other.sound == this.sound &&
          other.practise == this.practise &&
          other.word == this.word &&
          other.translate == this.translate);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<int> topic;
  final Value<int> image;
  final Value<int> sound;
  final Value<int> practise;
  final Value<String> word;
  final Value<String> translate;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.topic = const Value.absent(),
    this.image = const Value.absent(),
    this.sound = const Value.absent(),
    this.practise = const Value.absent(),
    this.word = const Value.absent(),
    this.translate = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    this.topic = const Value.absent(),
    this.image = const Value.absent(),
    this.sound = const Value.absent(),
    @required int practise,
    @required String word,
    @required String translate,
  })  : practise = Value(practise),
        word = Value(word),
        translate = Value(translate);
  WordsCompanion copyWith(
      {Value<int> id,
      Value<int> topic,
      Value<int> image,
      Value<int> sound,
      Value<int> practise,
      Value<String> word,
      Value<String> translate}) {
    return WordsCompanion(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      image: image ?? this.image,
      sound: sound ?? this.sound,
      practise: practise ?? this.practise,
      word: word ?? this.word,
      translate: translate ?? this.translate,
    );
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  final GeneratedDatabase _db;
  final String _alias;
  $WordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _topicMeta = const VerificationMeta('topic');
  GeneratedIntColumn _topic;
  @override
  GeneratedIntColumn get topic => _topic ??= _constructTopic();
  GeneratedIntColumn _constructTopic() {
    return GeneratedIntColumn('topic', $tableName, true,
        $customConstraints: 'NULL REFERENCES Topics(id)');
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedIntColumn _image;
  @override
  GeneratedIntColumn get image => _image ??= _constructImage();
  GeneratedIntColumn _constructImage() {
    return GeneratedIntColumn('image', $tableName, true,
        $customConstraints: 'NULL REFERENCES Images(id)');
  }

  final VerificationMeta _soundMeta = const VerificationMeta('sound');
  GeneratedIntColumn _sound;
  @override
  GeneratedIntColumn get sound => _sound ??= _constructSound();
  GeneratedIntColumn _constructSound() {
    return GeneratedIntColumn('sound', $tableName, true,
        $customConstraints: 'NULL REFERENCES Sounds(id)');
  }

  final VerificationMeta _practiseMeta = const VerificationMeta('practise');
  GeneratedIntColumn _practise;
  @override
  GeneratedIntColumn get practise => _practise ??= _constructPractise();
  GeneratedIntColumn _constructPractise() {
    return GeneratedIntColumn(
      'practise',
      $tableName,
      false,
    );
  }

  final VerificationMeta _wordMeta = const VerificationMeta('word');
  GeneratedTextColumn _word;
  @override
  GeneratedTextColumn get word => _word ??= _constructWord();
  GeneratedTextColumn _constructWord() {
    return GeneratedTextColumn('word', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _translateMeta = const VerificationMeta('translate');
  GeneratedTextColumn _translate;
  @override
  GeneratedTextColumn get translate => _translate ??= _constructTranslate();
  GeneratedTextColumn _constructTranslate() {
    return GeneratedTextColumn('translate', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, topic, image, sound, practise, word, translate];
  @override
  $WordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'words';
  @override
  final String actualTableName = 'words';
  @override
  VerificationContext validateIntegrity(WordsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.topic.present) {
      context.handle(
          _topicMeta, topic.isAcceptableValue(d.topic.value, _topicMeta));
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    }
    if (d.sound.present) {
      context.handle(
          _soundMeta, sound.isAcceptableValue(d.sound.value, _soundMeta));
    }
    if (d.practise.present) {
      context.handle(_practiseMeta,
          practise.isAcceptableValue(d.practise.value, _practiseMeta));
    } else if (isInserting) {
      context.missing(_practiseMeta);
    }
    if (d.word.present) {
      context.handle(
          _wordMeta, word.isAcceptableValue(d.word.value, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (d.translate.present) {
      context.handle(_translateMeta,
          translate.isAcceptableValue(d.translate.value, _translateMeta));
    } else if (isInserting) {
      context.missing(_translateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Word.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(WordsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.topic.present) {
      map['topic'] = Variable<int, IntType>(d.topic.value);
    }
    if (d.image.present) {
      map['image'] = Variable<int, IntType>(d.image.value);
    }
    if (d.sound.present) {
      map['sound'] = Variable<int, IntType>(d.sound.value);
    }
    if (d.practise.present) {
      map['practise'] = Variable<int, IntType>(d.practise.value);
    }
    if (d.word.present) {
      map['word'] = Variable<String, StringType>(d.word.value);
    }
    if (d.translate.present) {
      map['translate'] = Variable<String, StringType>(d.translate.value);
    }
    return map;
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(_db, alias);
  }
}

abstract class _$UserDatabase extends GeneratedDatabase {
  _$UserDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ImagesTable _images;
  $ImagesTable get images => _images ??= $ImagesTable(this);
  $TopicsTable _topics;
  $TopicsTable get topics => _topics ??= $TopicsTable(this);
  $SoundsTable _sounds;
  $SoundsTable get sounds => _sounds ??= $SoundsTable(this);
  $VideosTable _videos;
  $VideosTable get videos => _videos ??= $VideosTable(this);
  $WordsTable _words;
  $WordsTable get words => _words ??= $WordsTable(this);
  TopicDao _topicDao;
  TopicDao get topicDao => _topicDao ??= TopicDao(this as UserDatabase);
  WordDao _wordDao;
  WordDao get wordDao => _wordDao ??= WordDao(this as UserDatabase);
  SoundDao _soundDao;
  SoundDao get soundDao => _soundDao ??= SoundDao(this as UserDatabase);
  VideoDao _videoDao;
  VideoDao get videoDao => _videoDao ??= VideoDao(this as UserDatabase);
  ImageDao _imageDao;
  ImageDao get imageDao => _imageDao ??= ImageDao(this as UserDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [images, topics, sounds, videos, words];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ImageDaoMixin on DatabaseAccessor<UserDatabase> {
  $ImagesTable get images => db.images;
}
mixin _$SoundDaoMixin on DatabaseAccessor<UserDatabase> {
  $SoundsTable get sounds => db.sounds;
}
mixin _$VideoDaoMixin on DatabaseAccessor<UserDatabase> {
  $VideosTable get videos => db.videos;
}
mixin _$TopicDaoMixin on DatabaseAccessor<UserDatabase> {
  $TopicsTable get topics => db.topics;
  $ImagesTable get images => db.images;
}
mixin _$WordDaoMixin on DatabaseAccessor<UserDatabase> {
  $WordsTable get words => db.words;
  $TopicsTable get topics => db.topics;
  $ImagesTable get images => db.images;
  $SoundsTable get sounds => db.sounds;
}
