import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_banco/database/app_database.dart';
import 'package:meu_banco/models/contato.dart';
import 'package:meu_banco/screens/usuarios/formulario.dart';

class ListContatos extends StatefulWidget {
  @override
  _ListContatosState createState() => _ListContatosState();
}

class _ListContatosState extends State<ListContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Usuarios'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ContactForm())).then((value) {
              setState((){});
            });
          },
        ),
        body: FutureBuilder<List<Contato>>(
          future: findAll(),
          initialData: List<Contato>(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                List<Contato> contatos = snapshot.data;
                return ListView.builder(
                  itemCount: contatos.length,
                  itemBuilder: (context, index) {
                    final Contato contato = contatos[index];
                    if (contatos.length == 0) {
                      return Center(
                        child: Text(
                          'Nenhum contato encontrado',
                          style: TextStyle(fontSize: 36),
                        ),
                      );
                    } else {
                      return CardContato(contato);
                    }
                  },
                  scrollDirection: Axis.vertical,
                );
                break;
            }
            return Center(
              child: Text(
                'deu ruim ^.^"',
                style: TextStyle(fontSize: 36),
              ),
            );
          },
        ));
  }
}

class CardContato extends StatelessWidget {
  final Contato contato;

  CardContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contato.conta.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
