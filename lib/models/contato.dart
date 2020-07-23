class Contato {
  final int id;
  final String nome;
  final int conta;

  Contato({
    this.id,
    this.nome,
    this.conta,
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'Novo contato $nome e conta $conta';
  }
}
