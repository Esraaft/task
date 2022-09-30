import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../models/note/note_model.dart';

class DatabaseHelper {
  bool isSwitched = false;
  static DatabaseHelper _databaseHelper =
      DatabaseHelper._createInstance(); //Singleton DatabaseHelper
  static Database? _database; //Singleton Database

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<Database> get database async =>
      _database ??= await initializeDatabase();

  Future<Database> initializeDatabase() async {
    //Get the directory path for both Android and iOS to store Database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "assignedNotes.db";

    //Open/Create the database at the given path
    var noteDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return noteDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE User (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, imageAsBase64 TEXT, intrestId INTEGER, password TEXT, username TEXT)');
  }

  //Fetch Operation: Get all Task objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = db.rawQuery('SELECT * FROM Note');
    return result;
  }

  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList(); //Get Map List from database
    int count = noteMapList.length;

    List<Note> taskList = [];
    //For loop to create Task List from a Map List
    for (int i = 0; i < count; i++) {
      taskList.add(Note.fromMapObject(noteMapList[i]));
    }
    print(taskList);
    return taskList;
  }
}
