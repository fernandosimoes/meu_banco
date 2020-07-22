import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_banco/screens/usuarios/formulario.dart';

class ListUsuarios extends StatelessWidget {
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
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then(
                (value) => debugPrint(value.toString()),
              );
        },
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
