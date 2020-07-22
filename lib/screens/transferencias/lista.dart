import 'package:flutter/material.dart';
import 'package:meu_banco/models/transferencia.dart';
import 'package:meu_banco/screens/transferencias/formulario.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return _StateTransferencias();
  }
}

class _StateTransferencias extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    getBody() {
      if (widget._transferencias.length == 0) {
        return Center(
          child: Text(
            'Nenhuma transferencia encontrada',
            style: TextStyle(fontSize: 24.0),
          ),
        );
      }
      return ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, position) {
          final transferencia = widget._transferencias[position];
          return ItemTransferencia(transferencia);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final Future<Transferencia> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              updateLista(transferenciaRecebida);
            }).catchError((error) {
              debugPrint('error $error');
            });
          },
          child: Icon(Icons.add),
        ),
        body: getBody());
  }

  void updateLista(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}
