//import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/blog_list.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/blogitem.dart';


class DbHelper {


  static const int _version = 1;
  static const String _blogListstableName = 'bloglists';
  static const String _blogItemstableName = 'blogitems';

  static Database? _db;

  DbHelper._internal();
  static final DbHelper _dbHelper = DbHelper._internal();
  factory DbHelper() {
    return _dbHelper;
  }


  static const _columnBlogListId = "id";
  static const _columnBlogListTitle = "title";
  static const _columnBlogListCategory = "category";
  static const _columnBlogListBlogName = "blogName";
  static const _columnBlogListFavorateNum = "favorateNum";
  static const _columnBlogListImageUrl = "imageUrl";
  static const _columnBlogListCreatedDateTime = "createdDateTime";
  static const _columnBlogListContent = "content";


  // Future<Database> openDb() async {
  //   if (db == null) {
  //     db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
  //         onCreate: (database, version) {
  //           database.execute(
  //               'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
  //           database.execute(
  //               'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT, note TEXT, ' +
  //                   'FOREIGN KEY(idList) REFERENCES lists(id))');
  //         }, version: version);
  //   }
  //   return db;
  // }

  static Future<void> initDatabase() async {

    if (_db != null) {
      debugPrint("DB not null");
      return;
    }
    else {
      try {
      String dbPath = await getDatabasesPath();
      String path = p.join(dbPath, "blog.db");
      _db = await openDatabase(
        path,
        version:_version,
        onCreate: (Database db, int version) async {
          print("Creating DB");
          await db.execute(
             "CREATE TABLE $_blogListstableName("
                "$_columnBlogListId INTEGER PRIMARY KEY AUTOINCREMENT, "
                "$_columnBlogListTitle STRING,"
                "$_columnBlogListCategory TEXT,"
                "$_columnBlogListBlogName STRING, "
                "$_columnBlogListFavorateNum INTEGER,"
                "$_columnBlogListImageUrl STRING, "
                "$_columnBlogListCreatedDateTime STRING, "
                "$_columnBlogListContent TEXT "
                ")"
         );
         await db.execute(
                 'CREATE TABLE $_blogItemstableName(id INTEGER PRIMARY KEY, idList INTEGER, title STRING, imageUrl STRING, blogName STRING, author STRING, category STRING, content TEXT, status STRING, isFavorate STRING, createdAt STRING, favorateNum INTEGER, ' +
                     'FOREIGN KEY(idList) REFERENCES lists(id))');
         print("Datebase Created");
      });} catch (error){
        print("an error occurred $error");
    }
      }
    }
      // await _db?.execute('''INSERT INTO $_blogliststableName VALUES(20, "How to report", "security", "CProfessional", 15, "bai_du_com", "2023_1_31")''');
      // await _db?.execute(
      //     '''INSERT INTO $_blogitemstableName VALUES(20, 20, "How to report", "https://www.baidu.com", "CProfessional","zzlovethis","security","this is an article about chemical safety method","like","true","2023年1月6日21点",20)''');
      //
      // //print(_db.);
      // print(_blogliststableName.isNotEmpty);
      // print(_blogitemstableName.isNotEmpty);
      // //print(_db!.database);
      // await _db?.execute('''INSERT INTO $_blogliststableName VALUES(20, "How to report", "security", "CProfessional", 15, "bai_du_com", "2023_1_31")''');
      // await _db?.execute(
      //     '''INSERT INTO $_blogitemstableName VALUES(20, 20, "How to report", "https://www.baidu.com", "CProfessional","zzlovethis","security","this is an article about chemical safety method","like","true","2023年1月6日21点",20)''');
      // List? lists = await _db?.rawQuery('select * from $_blogliststableName');
      // List? items = await _db?.rawQuery('select * from $_blogitemstableName');
      // print(lists?[1].toString());
      // print(items?[1].toString());
      // print(lists?.length);
      // print(items?.length);
      // //print(_db.query(_blogliststableName));

    //print(_db.isOpen);
    // catch (error) {
    //   if (kDebugMode) {
    //     print('Error to open DB: ${error.toString()}');
    //   }
    // }

  static void testDb() async{
    initDatabase();
    //_db = await initDatabase();
    print(_db?.isOpen);
    //initDatabase();
    //DbHelper? _db = DbHelper();
    await _db?.execute('INSERT INTO $_blogListstableName VALUES(17, "How to report", "security", "CProfessional", 15, "bai_du_com", "2023_1_31")');
    await _db?.execute(
        'INSERT INTO $_blogItemstableName VALUES(17, 17, "How to report", "https://www.baidu.com", "CProfessional","zzlovethis","security","this is an article about chemical safety method","like","true","2023年1月6日21点",20)');
    List? lists = await _db?.rawQuery('select * from $_blogListstableName');
    List? items = await _db?.rawQuery('select * from $_blogItemstableName');
    print(lists?[lists.length-1].toString());
    print(items?[items.length-1].toString());
    print(lists?.length);
    print(items?.length);
  }

  // Future<Database?> openDb() async {
  //   if (db == null) {
  //     db = await openDatabase(
  //         join(await getDatabasesPath(), 'blog.db'),
  //         version:version,
  //         onCreate: (database, version) async{
  //            await database.execute(
  //               "CREATE TABLE $_blogliststableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, category STRING, blogName STRING, favorateNum INTEGER, imageUrl STRING, createdDateTime TEXT)",);
  //            await database.execute(
  //               'CREATE TABLE $_blogitemstableName(id INTEGER PRIMARY KEY, idList INTEGER, title STRING, imageUrl STRING, blogName STRING, author STRING, category STRING, content TEXT, status STRING, isFavorate STRING, createdAt STRING, favorateNum INTEGER, ' +
  //               'FOREIGN KEY(idList) REFERENCES lists(id))');
  //         },
  //     );
  //     }
  //   return db;
  // }

  Future<List<Map<String, dynamic>>?> query() async {
//testDb();
    initDatabase();
    print("Query function called");
    return await _db!.query(_blogListstableName);

  }


  Future<List<Map<String, dynamic>>?> queryItem(int idList) async {
    initDatabase();
    return await _db?.query('$_blogItemstableName', where: 'idList = ?', whereArgs: [idList]);
  }

  // static Future<int> insert(TaskModel task) async {
  //   return await _db?.insert(_tableName, task.toJson()) ?? 1;
  // }

  Future<int> insertList(BlogList list) async {
    initDatabase();
    try {
      return await _db!.insert(
        '$_blogListstableName',
        list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );} catch (error) {
      return 90000;
    }
    }

  Future<int> insertItem(BlogItem item) async {
    initDatabase();
    try{
      return await _db!.insert(
        '$_blogItemstableName',
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );} catch (error){
      return 80000;
    }
  }

  Future<int> delete(BlogList list) async {
    initDatabase();
    return await _db!.delete(_blogListstableName, where: 'id=?', whereArgs: [list.id]);
  }



  // Future<List<ShoppingList>> getLists() async {
  //   final List<Map<String, dynamic>> maps = await db.query('lists');
  //   return List.generate(maps.length, (i) {
  //     return ShoppingList(
  //       maps[i]['id'],
  //       maps[i]['name'],
  //       maps[i]['priority'],
  //     );
  //   });
  // }

  Future<List<BlogList>> getLists() async {
     //initDatabase();

    //final List<Map<String, dynamic>> maps =  db?.query('$_blogliststableName') as List<Map<String, dynamic>>;
    final List<Map<String, dynamic>> maps =  await _db!.query(_blogListstableName);
    print(maps.length);
    return List.generate(maps.length, (index) {
      return BlogList(
        id: maps[index]['id']??1,
        title: maps[index]['title']??"sample0",
        category: maps[index]['category']??"none",
        blogName: maps[index]['blogName']??"zzlovethis",
        favorateNum: maps[index]['favorateNum']??10,
        imageUrl: maps[index]['imageUrl']??"www.zz.com",
        createdDateTime: maps[index]['createdDateTime']??"2023-03-03",
        content: maps[index]['content']??"this is technical blog,it's description",
      );
  }
  );
  }

  Future<List<BlogItem>> getItems(int idList) async {
    initDatabase();
    final List<Map<String, dynamic>> maps =
    await _db?.query('$_blogItemstableName', where: 'idList = ?', whereArgs: [idList]) as List<Map<String, dynamic>>;
    return List.generate(maps.length, (i) {
      return BlogItem(
        id:maps[i]['id'],
        idList:maps[i]['idList'],
        title:maps[i]['title'],
        blogName:maps[i]['blogName'],
        author:maps[i]['author'],
        isFavorate:maps[i]['isFavorate'],
        content:maps[i]['content'],
        category:maps[i]['category'],
        createdAt:maps[i]['createdAt'],
        status:maps[i]['status'],
        favorateNum:maps[i]['favorateNum'],
        imageUrl:maps[i]['imageUrl'],
        //content:maps[i]['content'],
      );
    });
  }



  Future<int?> deleteList(BlogList list) async {
    //initDatabase();
    //int? result = await _db?.delete("$_blogItemstableName", where: "idList = ?", whereArgs: [list.id]);
    int? result = await _db?.delete("$_blogListstableName", where: "id = ?", whereArgs: [list.id]);
    //getLists();
    return result;
  }

  Future<int> updateBlogLists(int id) async {
    initDatabase();
    print("update function called");
    return await _db!.rawUpdate('''
    UPDATE $_blogListstableName   
    SET title = ?
    WHERE id = ?
    ''', ["modified story", id]);
  }

  Future<int> updateBlogItem(int id) async {
    initDatabase();
    print("update function called");
    return await _db!.rawUpdate('''
    UPDATE $_blogItemstableName   
    SET title = ?
    WHERE id = ?
    ''', ["modified items", id]);
  }



// int count = await database.rawUpdate("UPDATE Test SET name = ?, value = ? WHERE name = ?",
  // ["updated name", "9876", "some name"]);
  // print("updated: $count");

}

