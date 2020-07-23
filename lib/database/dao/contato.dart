import 'package:meu_banco/database/app_database.dart';
import 'package:meu_banco/models/contato.dart';

class ContatoDao {
  static const String tablesql = 'CREATE TABLE contatos('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'nome STRING,'
      'conta INTEGER'
      ')';

  Future<int> save(Contato contato) async {
    final database = await createDatabase();
    Map<String, dynamic> contatoMap = mapContato(contato);
    return database.insert('contatos', contatoMap);
  }

  Map<String, dynamic> mapContato(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['nome'] = contato.nome;
    contatoMap['conta'] = contato.conta;
    return contatoMap;
  }

  Future<List<Contato>> findAll() async {
    final database = await createDatabase();
    final listaContato = await database.query('contatos');
    List<Contato> contatos = mapListaContatos(listaContato);

    return contatos;
  }

  List<Contato> mapListaContatos(List<Map<String, dynamic>> listaContato) {
    final List<Contato> contatos = List();
    listaContato.forEach((elementoContato) {
      final Contato c = new Contato(
        nome: elementoContato['nome'],
        conta: elementoContato['conta'],
      );
      contatos.add(c);
    });
    return contatos;
  }
}