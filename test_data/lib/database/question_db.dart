import 'package:sqflite/sqflite.dart';
import 'package:test_data/database/database_service.dart';
import 'package:test_data/models/question.dart';

class QuestionDb {
  final tableName = 'questions';

  Future<void> createTable(Database db) async {
    await db.execute(
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, result INTEGER, detail TEXT, opinion TEXT)',
    );
  }

  Future<int> create(
      {required int id, required String title, required int result}) async {
    final db = await DatabaseService().database;
    return await db.rawInsert(
        '''INSERT INTO $tableName (id, title, result) VALUES (?, ?, ?)''',
        [id, title, result]);
  }

  Future<List<Question>> getAll() async {
    final dbase = await DatabaseService().database;
    final ques = await dbase.rawQuery('''SELECT * FROM $tableName''');
    return ques.map((que) => Question.fromSqfliteDatabase(que)).toList();
  }

  Future<Question> getById(int id) async {
    final dbs = await DatabaseService().database;
    final qus = await dbs.query(tableName, where: 'id = ?', whereArgs: [id]);
    return Question.fromSqfliteDatabase(qus.first);
  }
}
