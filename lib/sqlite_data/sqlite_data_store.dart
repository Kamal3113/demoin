import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBUserManager {
  Database? _database;

  Future openDB() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "userData.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE userData(id INTEGER PRIMARY KEY AUTOINCREMENT,yogaName TEXT,image TEXT ,calories TEXT)");
      });
    }
  }

  Future<int> insertHistory(HistoryData userData) async {
    await openDB();
    return await _database!.insert('userData', userData.toMap());
  }

  Future<List<HistoryData>> getHistoryList() async {
    await openDB();

    final List<Map<String, dynamic>> maps = await _database!.rawQuery(
      'SELECT * FROM userData ORDER BY id DESC LIMIT 5',
    );

    return List.generate(maps.length, (index) {
      return HistoryData(
        id: maps[index]['id'],
        yogaName: maps[index]['yogaName'],
        image: maps[index]['image'],
        calories: maps[index]['calories'],
      );
    });
  }

  Future<void> deleteExcessRecords() async {
    await openDB();

    // Get the IDs of the last 5 records
    final List<Map<String, dynamic>> lastFiveRecords =
    await _database!.rawQuery(
      'SELECT id FROM userData ORDER BY id DESC LIMIT 5',
    );

    // Extract the IDs from the result
    final List<int> idsToKeep =
    lastFiveRecords.map<int>((record) => record['id']).toList();

    // Delete records that are not in the list of IDs to keep
    await _database!.rawDelete(
      'DELETE FROM userData WHERE id NOT IN (${idsToKeep.join(', ')})',
    );
  }

  Future<int> updateHistory(HistoryData userData) async {
    await openDB();
    return await _database!.update('userData', userData.toMap(),
        where: 'id=?', whereArgs: [userData.id]);
  }

  Future<void> deleteHistory(int id) async {
    await openDB();
    await _database!.delete("userData", where: "id = ? ", whereArgs: [id]);
  }
}

class HistoryData {
  int? id;
  String? yogaName;
  String? image;
  String? calories;

  HistoryData(
      {@required this.yogaName, @required this.image, this.id, this.calories});

  Map<String, dynamic> toMap() {
    return {'yogaName': yogaName, 'image': image, 'calories': calories};
  }
}
