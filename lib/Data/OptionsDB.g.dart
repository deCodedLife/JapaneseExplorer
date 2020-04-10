// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OptionsDB.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Propertie extends DataClass implements Insertable<Propertie> {
  final int lang;
  final int theme;
  final int first;
  Propertie({@required this.lang, @required this.theme, @required this.first});
  factory Propertie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return Propertie(
      lang: intType.mapFromDatabaseResponse(data['${effectivePrefix}lang']),
      theme: intType.mapFromDatabaseResponse(data['${effectivePrefix}theme']),
      first: intType.mapFromDatabaseResponse(data['${effectivePrefix}first']),
    );
  }
  factory Propertie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Propertie(
      lang: serializer.fromJson<int>(json['lang']),
      theme: serializer.fromJson<int>(json['theme']),
      first: serializer.fromJson<int>(json['first']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lang': serializer.toJson<int>(lang),
      'theme': serializer.toJson<int>(theme),
      'first': serializer.toJson<int>(first),
    };
  }

  @override
  PropertiesCompanion createCompanion(bool nullToAbsent) {
    return PropertiesCompanion(
      lang: lang == null && nullToAbsent ? const Value.absent() : Value(lang),
      theme:
          theme == null && nullToAbsent ? const Value.absent() : Value(theme),
      first:
          first == null && nullToAbsent ? const Value.absent() : Value(first),
    );
  }

  Propertie copyWith({int lang, int theme, int first}) => Propertie(
        lang: lang ?? this.lang,
        theme: theme ?? this.theme,
        first: first ?? this.first,
      );
  @override
  String toString() {
    return (StringBuffer('Propertie(')
          ..write('lang: $lang, ')
          ..write('theme: $theme, ')
          ..write('first: $first')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(lang.hashCode, $mrjc(theme.hashCode, first.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Propertie &&
          other.lang == this.lang &&
          other.theme == this.theme &&
          other.first == this.first);
}

class PropertiesCompanion extends UpdateCompanion<Propertie> {
  final Value<int> lang;
  final Value<int> theme;
  final Value<int> first;
  const PropertiesCompanion({
    this.lang = const Value.absent(),
    this.theme = const Value.absent(),
    this.first = const Value.absent(),
  });
  PropertiesCompanion.insert({
    @required int lang,
    @required int theme,
    @required int first,
  })  : lang = Value(lang),
        theme = Value(theme),
        first = Value(first);
  PropertiesCompanion copyWith(
      {Value<int> lang, Value<int> theme, Value<int> first}) {
    return PropertiesCompanion(
      lang: lang ?? this.lang,
      theme: theme ?? this.theme,
      first: first ?? this.first,
    );
  }
}

class $PropertiesTable extends Properties
    with TableInfo<$PropertiesTable, Propertie> {
  final GeneratedDatabase _db;
  final String _alias;
  $PropertiesTable(this._db, [this._alias]);
  final VerificationMeta _langMeta = const VerificationMeta('lang');
  GeneratedIntColumn _lang;
  @override
  GeneratedIntColumn get lang => _lang ??= _constructLang();
  GeneratedIntColumn _constructLang() {
    return GeneratedIntColumn(
      'lang',
      $tableName,
      false,
    );
  }

  final VerificationMeta _themeMeta = const VerificationMeta('theme');
  GeneratedIntColumn _theme;
  @override
  GeneratedIntColumn get theme => _theme ??= _constructTheme();
  GeneratedIntColumn _constructTheme() {
    return GeneratedIntColumn(
      'theme',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstMeta = const VerificationMeta('first');
  GeneratedIntColumn _first;
  @override
  GeneratedIntColumn get first => _first ??= _constructFirst();
  GeneratedIntColumn _constructFirst() {
    return GeneratedIntColumn(
      'first',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [lang, theme, first];
  @override
  $PropertiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'properties';
  @override
  final String actualTableName = 'properties';
  @override
  VerificationContext validateIntegrity(PropertiesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.lang.present) {
      context.handle(
          _langMeta, lang.isAcceptableValue(d.lang.value, _langMeta));
    } else if (isInserting) {
      context.missing(_langMeta);
    }
    if (d.theme.present) {
      context.handle(
          _themeMeta, theme.isAcceptableValue(d.theme.value, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (d.first.present) {
      context.handle(
          _firstMeta, first.isAcceptableValue(d.first.value, _firstMeta));
    } else if (isInserting) {
      context.missing(_firstMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Propertie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Propertie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PropertiesCompanion d) {
    final map = <String, Variable>{};
    if (d.lang.present) {
      map['lang'] = Variable<int, IntType>(d.lang.value);
    }
    if (d.theme.present) {
      map['theme'] = Variable<int, IntType>(d.theme.value);
    }
    if (d.first.present) {
      map['first'] = Variable<int, IntType>(d.first.value);
    }
    return map;
  }

  @override
  $PropertiesTable createAlias(String alias) {
    return $PropertiesTable(_db, alias);
  }
}

class ApiData extends DataClass implements Insertable<ApiData> {
  final int id;
  final int service;
  final String link;
  final String func;
  ApiData(
      {@required this.id,
      @required this.service,
      @required this.link,
      @required this.func});
  factory ApiData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ApiData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      service:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}service']),
      link: stringType.mapFromDatabaseResponse(data['${effectivePrefix}link']),
      func: stringType.mapFromDatabaseResponse(data['${effectivePrefix}func']),
    );
  }
  factory ApiData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ApiData(
      id: serializer.fromJson<int>(json['id']),
      service: serializer.fromJson<int>(json['service']),
      link: serializer.fromJson<String>(json['link']),
      func: serializer.fromJson<String>(json['func']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'service': serializer.toJson<int>(service),
      'link': serializer.toJson<String>(link),
      'func': serializer.toJson<String>(func),
    };
  }

  @override
  ApiCompanion createCompanion(bool nullToAbsent) {
    return ApiCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      service: service == null && nullToAbsent
          ? const Value.absent()
          : Value(service),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      func: func == null && nullToAbsent ? const Value.absent() : Value(func),
    );
  }

  ApiData copyWith({int id, int service, String link, String func}) => ApiData(
        id: id ?? this.id,
        service: service ?? this.service,
        link: link ?? this.link,
        func: func ?? this.func,
      );
  @override
  String toString() {
    return (StringBuffer('ApiData(')
          ..write('id: $id, ')
          ..write('service: $service, ')
          ..write('link: $link, ')
          ..write('func: $func')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(service.hashCode, $mrjc(link.hashCode, func.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ApiData &&
          other.id == this.id &&
          other.service == this.service &&
          other.link == this.link &&
          other.func == this.func);
}

class ApiCompanion extends UpdateCompanion<ApiData> {
  final Value<int> id;
  final Value<int> service;
  final Value<String> link;
  final Value<String> func;
  const ApiCompanion({
    this.id = const Value.absent(),
    this.service = const Value.absent(),
    this.link = const Value.absent(),
    this.func = const Value.absent(),
  });
  ApiCompanion.insert({
    this.id = const Value.absent(),
    @required int service,
    @required String link,
    @required String func,
  })  : service = Value(service),
        link = Value(link),
        func = Value(func);
  ApiCompanion copyWith(
      {Value<int> id,
      Value<int> service,
      Value<String> link,
      Value<String> func}) {
    return ApiCompanion(
      id: id ?? this.id,
      service: service ?? this.service,
      link: link ?? this.link,
      func: func ?? this.func,
    );
  }
}

class $ApiTable extends Api with TableInfo<$ApiTable, ApiData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ApiTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _serviceMeta = const VerificationMeta('service');
  GeneratedIntColumn _service;
  @override
  GeneratedIntColumn get service => _service ??= _constructService();
  GeneratedIntColumn _constructService() {
    return GeneratedIntColumn(
      'service',
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
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _funcMeta = const VerificationMeta('func');
  GeneratedTextColumn _func;
  @override
  GeneratedTextColumn get func => _func ??= _constructFunc();
  GeneratedTextColumn _constructFunc() {
    return GeneratedTextColumn('func', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  @override
  List<GeneratedColumn> get $columns => [id, service, link, func];
  @override
  $ApiTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'api';
  @override
  final String actualTableName = 'api';
  @override
  VerificationContext validateIntegrity(ApiCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.service.present) {
      context.handle(_serviceMeta,
          service.isAcceptableValue(d.service.value, _serviceMeta));
    } else if (isInserting) {
      context.missing(_serviceMeta);
    }
    if (d.link.present) {
      context.handle(
          _linkMeta, link.isAcceptableValue(d.link.value, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (d.func.present) {
      context.handle(
          _funcMeta, func.isAcceptableValue(d.func.value, _funcMeta));
    } else if (isInserting) {
      context.missing(_funcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ApiData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ApiData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ApiCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.service.present) {
      map['service'] = Variable<int, IntType>(d.service.value);
    }
    if (d.link.present) {
      map['link'] = Variable<String, StringType>(d.link.value);
    }
    if (d.func.present) {
      map['func'] = Variable<String, StringType>(d.func.value);
    }
    return map;
  }

  @override
  $ApiTable createAlias(String alias) {
    return $ApiTable(_db, alias);
  }
}

abstract class _$OptionsDatabase extends GeneratedDatabase {
  _$OptionsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PropertiesTable _properties;
  $PropertiesTable get properties => _properties ??= $PropertiesTable(this);
  $ApiTable _api;
  $ApiTable get api => _api ??= $ApiTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [properties, api];
}
