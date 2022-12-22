import 'package:dgtera_tablet_app/Models/TaxModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/shiftItemsModle.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:io' as io;
import 'package:path/path.dart';



class DBHelper {

  static Database? _db ;

  Future<Database?> get db async {
    if(_db != null){
      return _db!;
    }

    _db = await initDatabase();
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory() ;
    String path = join(documentDirectory.path , 'tax.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate,);
    return db ;
  }

  _onCreate (Database db , int version )async{
    await db
        .execute('CREATE TABLE item (taxName INTEGER)');
  }

  Future<Tax> insert(Tax tax)async{
    print(tax.toMap());
    var dbClient = await db ;
    await dbClient!.insert('item', tax.toMap());
    return tax ;

  }

  deleteAll() async {
    var dbClient = await db ;
    return await dbClient!.delete('item');
  }

  Future<List<Tax>> getTaxList()async{
    var dbClient = await db ;
    final List<Map<String , Object?>> queryResult =  await dbClient!.query('item');
    return queryResult.map((e) => Tax.fromMap(e)).toList();

  }

  Future<int> delete(int id)async{
    var dbClient = await db ;
    return await dbClient!.delete(
        'item',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<int> updateQuantity(Item item)async{
    var dbClient = await db ;
    return await dbClient!.update(
        'item',
        item.toMap(),
        where: 'id = ?',
        whereArgs: [item.id]
    );
  }
}