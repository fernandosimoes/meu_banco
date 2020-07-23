import 'package:meu_banco/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'meubanco.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'nome STRING,'
          'conta INTEGER'
          ')');
    },
    version: 1,
  );
}

Future<int> save(Contato contato) async {
  final database = await createDatabase();
  final Map<String, dynamic> contatoMap = Map();
  contatoMap['nome'] = contato.nome;
  contatoMap['conta'] = contato.conta;
  return database.insert('contatos', contatoMap);
}

Future<List<Contato>> findAll() async {
  final database = await createDatabase();
  final maps = await database.query('contatos');
  final List<Contato> contatos = List();
  maps.forEach((elementoContato) {
    final Contato c = new Contato(
      nome: elementoContato['nome'],
      conta: elementoContato['conta'],
    );
    contatos.add(c);
  });

  return contatos;
}
