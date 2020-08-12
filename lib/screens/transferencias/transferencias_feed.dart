import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_banco/components/empty_state.dart';
import 'package:meu_banco/components/loading_component.dart';
import 'package:meu_banco/http/webclient.dart';
import 'package:meu_banco/models/contato.dart';

class TransferenciasFeed extends StatefulWidget {
  @override
  _TransferenciasFeedState createState() => _TransferenciasFeedState();
}

class _TransferenciasFeedState extends State<TransferenciasFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: findAllTransactions(),
        builder: (context, snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return LoadingComponent();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
                return _listTransactions(snapshot);
              break;
          }
          return EmptyState();;
        },
      ),
    );
  }

  ListView _listTransactions(AsyncSnapshot<List<Transaction>> snapshot) {
    final List<Transaction> transactions = snapshot.data;
    return ListView.builder(
      itemBuilder: (context, index) {
        final Transaction transaction = transactions[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              transaction.value.toString(),
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              transaction.contato.conta.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}

class Transaction {
  final double value;
  final Contato contato;

  Transaction(
    this.value,
    this.contato,
  );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contato}';
  }
}
