import 'package:flutter/cupertino.dart';

class Usuario {
  final String _nome;
  final int _conta;
  Usuario(this._nome, this._conta);


  @override
  String toString() {
    // TODO: implement toString
    return 'Novo usuario $_nome e conta $_conta';
  }

}
