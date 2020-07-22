import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_banco/models/usuario.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _conta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nome,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              controller: _conta,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: 'Numero da conta',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Cadastrar'),
                  onPressed: () {
                    if (_nome != null && _conta != null) {
                      final Usuario usuario = Usuario(
                        _nome.text,
                        int.parse(_conta.text)
                      );
                      Navigator.pop(context, usuario);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
