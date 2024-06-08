import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'info_data_table.dart';

class DatabaseHelper {
  static const _databaseName = "datastore.db";
  static const _databaseVersion = 1;
  static final columnId = 'id';
  static const tableInfoData = 'info_data_table';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    debugPrint(path);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    // dropTable(db);
    //tableSubjects create
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableInfoData (
            ${InfoDataFields.id} INTEGER PRIMARY KEY,
            ${InfoDataFields.institution_name} TEXT,
            ${InfoDataFields.mobile} TEXT,
            ${InfoDataFields.phone} TEXT,
            ${InfoDataFields.email} TEXT,
            ${InfoDataFields.establish_year} TEXT,
            ${InfoDataFields.office_type} INTEGER,
            ${InfoDataFields.ownership_type} INTEGER,
            ${InfoDataFields.economic_activity_type} INTEGER,
            ${InfoDataFields.male_worker_count} INTEGER,
            ${InfoDataFields.female_worker_count} INTEGER,
            ${InfoDataFields.status} INTEGER,
            ${InfoDataFields.server} INTEGER,
            ${InfoDataFields.date_time} TEXT,
            ${InfoDataFields.latitude} TEXT,
            ${InfoDataFields.longitude} TEXT
          )
          ''');
  }

  Future<bool> addInfoData(InfoData infoData) async {
    final db = await instance.database;
    bool save = false;
    if (infoData.id == null) {
      await db.insert(tableInfoData, infoData.toJson());
      debugPrint('Info Data inserted');
      save = true;
    } else {
      await db.update(
        tableInfoData,
        infoData.toJson(),
        where: '${InfoDataFields.id} = ?',
        whereArgs: [infoData.id],
      );
      debugPrint('Info Data updated');
      save = true;
    }
    return save;
  }

  Future<bool> updateServerStatus(
      bool server, String mobile, String email) async {
    final db = await instance.database;
    bool save = false;
    List<Map<String, dynamic>> result = await db.query(tableInfoData,
        where: '${InfoDataFields.mobile} = ? AND ${InfoDataFields.email} = ?',
        whereArgs: [mobile, email]);
    if (result.isNotEmpty) {
      InfoData data = InfoData.fromJson(result.first);
      await db.rawQuery(
          'UPDATE $tableInfoData SET ${InfoDataFields.server}=${server ? 1 : 0} WHERE ${InfoDataFields.id}=${data.id}');
      debugPrint('Info Data server updated');
      save = true;
    }

    return save;
  }

  Future<List<InfoData>> getInfoDataList() async {
    final db = await instance.database;
    List<InfoData> infoDataList = [];

    List<Map<String, dynamic>> result = await db.query(
      tableInfoData,
    );
    if (result.isNotEmpty) {
      infoDataList = result.map((json) => InfoData.fromJson(json)).toList();
    }
    return infoDataList;
  }

  Future<int> getOfflineDataCount() async {
    final db = await instance.database;
    List<InfoData> infoDataList = [];

    List<Map<String, dynamic>> result =
        await db.query(tableInfoData, where: '${InfoDataFields.server} = 0');
    if (result.isNotEmpty) {
      infoDataList = result.map((json) => InfoData.fromJson(json)).toList();
    }
    return infoDataList.length;
  }

  Future<int> getTotalDataCount() async {
    final db = await instance.database;
    List<InfoData> infoDataList = [];

    List<Map<String, dynamic>> result = await db.query(tableInfoData);
    if (result.isNotEmpty) {
      infoDataList = result.map((json) => InfoData.fromJson(json)).toList();
    }
    return infoDataList.length;
  }
}
