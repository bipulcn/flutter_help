import 'package:sqflite/sqflite.dart';
import 'package:test_data/database/database_service.dart';
import 'package:test_data/models/dogs.dart';

class DogDB {
  final tableName = 'dogs';

  Future<void> createTable(Database db) async {
    await db.execute(
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    );
  }

  Future<int> create({required String name, required int age}) async {
    final db = await DatabaseService().database;
    return await db.rawInsert(
        '''INSERT INTO $tableName (name, age) VALUES (?, ?)''', [name, age]);
  }

  Future<List<Dog>> getAll() async {
    final database = await DatabaseService().database;
    final dogs = await database.rawQuery('''SELECT * FROM $tableName''');
    return dogs.map((dog) => Dog.fromSqfliteDatabase(dog)).toList();
  }

  Future<Dog> fetchById(int id) async {
    final database = await DatabaseService().database;
    final dog =
        await database.query(tableName, where: 'id = ?', whereArgs: [id]);
    return Dog.fromSqfliteDatabase(dog.first);
  }

  Future<int> update({required int id, String? name, int? age}) async {
    final db = await DatabaseService().database;
    return await db.update(tableName, {'name': name, 'age': age},
        where: 'id=?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final db = await DatabaseService().database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
