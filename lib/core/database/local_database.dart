import 'package:credconnect/core/database/db_schema.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton 
class LocalDataSource {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {   
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'credconnect.db');
  
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();

    batch.execute(DbSchema.CREATECREDITPOOLTABLE);
    batch.execute(DbSchema.CREATEUSERSTABLE);
    batch.execute(DbSchema.CREATECLIENTSTABLE);
    batch.execute(DbSchema.CREATELOANSTABLE);

    await batch.commit();
  }

}