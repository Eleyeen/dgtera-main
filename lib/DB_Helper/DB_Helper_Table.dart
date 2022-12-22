
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/tablesqliteModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';


class DBHelperTable {
   static Database? _db ;

  Future<Database?> get db async {
    if(_db != null){
      return _db!;
    }

    _db = await initDatabase();
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory() ;
    String path = join(documentDirectory.path , 'tabledetail.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate,);
    return db ;
  }

  _onCreate (Database db , int version )async{
    await db
        .execute('CREATE TABLE tabledetail (tableId INTEGER , personNum INTEGER, id INTEGER,foodName TEXT, quantity INTEGER,note TEXT,discount INTEGER,size TEXT,totalPrice TEXT ,)');
  }

  Future<TableSQLiteModel> insert(TableSQLiteModel tax)async{
    print(tax.toMap());
    var dbClient = await db ;
    await dbClient!.insert('tabledetail', tax.toMap());
    return tax ;

  }

  deleteAll() async {
    var dbClient = await db ;
    return await dbClient!.delete('tabledetail');
  }

  Future<List<TableSQLiteModel>> getTaxList()async{
    var dbClient = await db ;
    final List<Map<String , Object?>> queryResult =  await dbClient!.query('tabledetail');
    return queryResult.map((e) => TableSQLiteModel.fromMap(e)).toList();

  }

  Future<int> delete(int id)async{
    var dbClient = await db ;
    return await dbClient!.delete(
        'tabledetail',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<int> updateQuantity(TableSQLiteModel item)async{
    var dbClient = await db ;
    return await dbClient!.update(
        'tabledetail',
        item.toMap(),
        where: 'id = ?',
        whereArgs: [item.id]
    );
  }
}