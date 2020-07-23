import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_banco/database/app_database.dart';
import 'package:meu_banco/models/contato.dart';
import 'package:meu_banco/screens/dashboard/dashboard.dart';

void main() async {
  runApp(MyBank());
}

class MyBank extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blue[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue[700],
              textTheme: ButtonTextTheme.primary)),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
