import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBFoodData {
  Database? _datebase;

  Future openDB() async {
    if (_datebase == null) {
      _datebase = await openDatabase(join(await getDatabasesPath(), "food.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE food(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,image TEXT,price TEXT)");
      });
    }
  }

  Future<int> insertFood(Food Food) async {
    await openDB();
    return await _datebase!.insert('food', Food.toMap());
  }

  Future<List<Food>> getFoodList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _datebase!.query('food');

    return List.generate(maps.length, (index) {
      return Food(
        id: maps[index]['id'],
        name: maps[index]['name'],
        image: maps[index]['image'],
        price: maps[index]['price'],
      );
    });
  }

  Future<void> deleteFood(int id) async {
    await openDB();
    await _datebase!.delete("food", where: "id = ? ", whereArgs: [id]);
  }
}

class Food {
  int? id;
  String? name;
  String? image;
  String? price;

  Food({@required this.name, this.image, this.price, this.id});

  Map<String, dynamic> toMap() {
    return {'name': name, 'image': image, 'price': price};
  }
}
