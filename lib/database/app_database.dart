import 'package:meu_banco/database/dao/contato.dart';
import 'package:meu_banco/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'meubanco.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.tablesql);
    },
    version: 1,
  );
}


