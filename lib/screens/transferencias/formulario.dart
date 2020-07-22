import 'package:flutter/material.dart';
import 'package:meu_banco/components/editor.dart';
import 'package:meu_banco/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controleNumeroConta = TextEditingController();
  final TextEditingController _controleValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controleNumeroConta,
              dica: '00000-0',
              rotulo: 'Numero da conta',
            ),
            Editor(
              controlador: _controleValor,
              dica: '100,00',
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criaTransferencia(context))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controleNumeroConta.text);
    final double valor = double.tryParse(_controleValor.text);
    if (numeroConta != null && valor != null) {
      final Transferencia transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}
