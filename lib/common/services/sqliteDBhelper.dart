import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';


class DbHelper {
  final int version = 1;
  Database? db;

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future testDb() async {
    db = await openDb();
    await db?.execute('INSERT INTO lists VALUES (0, "How to report", "report")');
    await db?.execute(
        'INSERT INTO items VALUES (0, 0, "How to report", "zzlovethis", "zz","safety","this is an article about chemical safety method","like",true,"202212111")');
    List? lists = await db?.rawQuery('select * from lists');
    List? items = await db?.rawQuery('select * from items');
    print(lists?[0].toString());
    print(items?[0].toString());
  }

  Future<Database?> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'blog.db'),
          onCreate: (database, version) {
            database.execute(
                'CREATE TABLE lists(id INTEGER PRIMARY KEY, title TEXT, category TEXT)');
            database.execute(
                'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER,  title TEXT, blogName TEXT, author TEXT,isFavorate BOOL,content TEXT,category TEXT, createdAt TEXT ,status TEXT, ' +
                    'FOREIGN KEY(idList) REFERENCES lists(id))');
          }, version: version);
    }
    return db;
  }

  Future<int> insertList(BlogList list) async {
    int? id = await this.db?.insert(
      'lists',
      list.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id!;
  }

  Future<int> insertItem(BlogItem item) async {
    int? id = await db?.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id!;
  }

  Future<List<BlogList>> getLists() async {
    final List<Map<String, dynamic>>? maps = await db?.query('lists');
    return List.generate(maps!.length, (i) {
      return BlogList(
        maps[i]['id'],
        maps[i]['title'],
        maps[i]['category'],
      );
    });
  }

  Future<List<BlogItem>> getItems(int idList) async {
    final List<Map<String, dynamic>>? maps =
    await db?.query('items', where: 'idList = ?', whereArgs: [idList]);
    return List.generate(maps!.length, (i) {
      return BlogItem(
        maps[i]['id'],
        maps[i]['idList'],
        maps[i]['title'],
        maps[i]['blogName'],
        maps[i]['author'],
        maps[i]['isFavorate'],
        maps[i]['content'],
        maps[i]['category'],
        maps[i]['createdAt'],
        maps[i]['status'],
      );
    });
  }

  Future<int> deleteList(BlogList list) async {
    int? result = await db?.delete("items", where: "idList = ?", whereArgs: [list.id]);
    result = await db?.delete("lists", where: "id = ?", whereArgs: [list.id]);
    return result!;
  }

}
