import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'OptionsDB.g.dart';

class Properties extends Table {
  IntColumn get lang => integer()();
  IntColumn get theme => integer()();
  IntColumn get first => integer()();
}

class Api extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get service => integer()();
  TextColumn get link => text().withLength(min: 1, max: 255)();
  TextColumn get func => text().withLength(min: 1, max: 32)();
  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Properties, Api])
class OptionsDatabase extends _$OptionsDatabase {
  OptionsDatabase() : super(
    FlutterQueryExecutor.inDatabaseFolder(
      path: 'properties.bin', 
      logStatements: true,
      ));
  @override
  int get schemaVersion => 1;

  Future<List<Propertie>> getAllProperty() => select(properties).get();
  Stream<List<Propertie>> watchAllProperty() => select(properties).watch();
  Future insertProperty(Propertie property) => into(properties).insert(property);
  Future updateProperty(Propertie property) => update(properties).replace(property);
  Future deleteProperty(Propertie property) => delete(properties).delete(property);

  Future<List<ApiData>> getAllApis() => select(api).get();
  Stream<List<ApiData>> watchAllApis() => select(api).watch();
  Future insertApi(ApiData apis) => into(api).insert(apis);
  Future updateApi(ApiData apis) => update(api).replace(apis);
  Future deleteApi(ApiData apis) => delete(api).delete(apis);
}