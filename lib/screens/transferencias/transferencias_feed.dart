import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_banco/models/contato.dart';

class TransferenciasFeed extends StatefulWidget {
  @override
  _TransferenciasFeedState createState() => _TransferenciasFeedState();
}

class _TransferenciasFeedState extends State<TransferenciasFeed> {
  final List<Transaction> transactions = List();

  @override
  Widget build(BuildContext context) {
    transactions.add(
      Transaction(100.0, Contato(nome: 'Fernando', conta: 1000)),);
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}

class Transaction {
  final double value;
  final Contato contato;

  Transaction(this.value,
      this.contato,);

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contato}';
  }

}

