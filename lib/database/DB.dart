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
        return db.execute("CREATE TABLE EXPENSES("
            "id INTEGER PRIMARY KEY,"
            "taskTitle TEXT,"
            "dueDate TEXT,"
            "desc TEXT"
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
    final List<Map<String, dynamic>> maps = await db.query("EXPENSES");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }

  // Insert
  static Future<void> insertData(Task ite) async {
    final Database db = await getDatabaseConnect();
    await db.insert(
      "EXPENSES",
      ite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  static Future<void> updateData(Task ite) async {
    final db = await getDatabaseConnect();
    await db.update(
      "EXPENSES",
      ite.toMap(),
      where: "id = ?",
      whereArgs: [ite.id],
    );
  }

  // Delete
  static Future<void> deleteData(int id) async {
    final db = await getDatabaseConnect();
    await db.delete(
      "EXPENSES",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // Show month transactions
  static Future<List<Task>> showMonthTrans(String itemExpMonth) async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM EXPENSES WHERE dueDate LIKE '$itemExpMonth%'");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }

  // Show transactions on a certain day
  static Future<List<Task>> showDayTrans(String itemExpDay) async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM EXPENSES WHERE dueDate LIKE '$itemExpDay%'");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }

  // Show transactions by desc
  static Future<List<Task>> showCatTrans(
      String itemExpDay, String catry) async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM EXPENSES WHERE dueDate LIKE '$itemExpDay%' AND desc LIKE '$catry%'");

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]["id"],
        taskTitle: maps[i]["taskTitle"],
        dueDate: maps[i]["dueDate"],
        desc: maps[i]["desc"],
        // itemPrice: maps[i]["itemPrice"],
      );
    });
  }
}
