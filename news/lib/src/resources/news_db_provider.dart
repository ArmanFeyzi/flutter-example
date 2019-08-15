import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../models/item_model.dart';
import 'repository.dart';


class NewsDbProvier implements Source, Cache{
  Database db;

  NewsDbProvier() {
    init();
  }

  Future<List<int>> fetchTopIDs(){
    return null;
  } 

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'item.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDB, int version) {
        newDB.execute("""
          CREATE TABLE Items
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
        """);
      }
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0 ) {
      return ItemModel.fromDB(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert(
      "Items", 
      item.toMapForDB(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> clear(){
    return db.delete("Items");
  }
}

final newsDbProvier = NewsDbProvier();