import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task.dart';

class ComDB {
  static Database? database;

  // Initialize database
  static Future<Database> initDatabase() async {
    database = await openDatabase(
      // Ensure the path is correctly for any platform
      join(await getDatabasesPath(), "hero_database.db"),
      onCreate: (db, version) {
        return db.execute("CREATE TABLE TASKS("
            "id INTEGER PRIMARY KEY,"
            "taskTitle TEXT,"
            "dueDate TEXT,"
            "desc TEXT,"
            "status TEXT,"
            "creationDate TEXT,"
            "updatedDate TEXT"
            ")");
      },

      // Version
      version: 1,
    );

    return database!;
  }

  // Check database connected
  static Future<Database> getDatabaseConnect() async {
    if (database != null) {
      return database!;
    } else {
      return await initDatabase();
    }
  }

  // Show all data
  static Future<List<Task>> showAllData() async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.query("TASKS");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        status: maps[i]["status"],
        creationDate: maps[i]["creationDate"],
        updatedDate: maps[i]["updatedDate"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }

  // Insert
  static Future<void> insertData(Task tsk) async {
    final Database db = await getDatabaseConnect();
    await db.insert(
      "TASKS",
      tsk.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  static Future<void> updateData(Task tsk) async {
    final db = await getDatabaseConnect();
    await db.update(
      "TASKS",
      tsk.toMap(),
      where: "id = ?",
      whereArgs: [tsk.id],
    );
  }

  // Delete
  static Future<void> deleteTask(int id) async {
    final db = await getDatabaseConnect();
    await db.delete(
      "TASKS",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //Show tasks by keyword
  static Future<List<Task>> searchByTitle(String keyWord) async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM TASKS WHERE taskTitle LIKE '%$keyWord%'");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        status: maps[i]["status"],
        creationDate: maps[i]["creationDate"],
        updatedDate: maps[i]["updatedDate"],
      );
    });
  }

  // Show tasks on a certain day
  static Future<List<Task>> showDayTasks(String taskDueDay) async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM TASKS WHERE dueDate LIKE '$taskDueDay%'");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        status: maps[i]["status"],
        creationDate: maps[i]["creationDate"],
        updatedDate: maps[i]["updatedDate"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }

  // Show tasks by desc
  static Future<List<Task>> showCatTrans(
      String itemExpDay, String catry) async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM TASKS WHERE dueDate LIKE '$itemExpDay%' AND desc LIKE '$catry%'");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        status: maps[i]["status"],
        creationDate: maps[i]["creationDate"],
        updatedDate: maps[i]["updatedDate"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }
}
