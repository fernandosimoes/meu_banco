import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_banco/screens/transferencias/lista.dart';
import 'package:meu_banco/screens/transferencias/transferencias_feed.dart';
import 'package:meu_banco/screens/usuarios/list.dart';
import 'package:meu_banco/http/webclient.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    findAllTransactions().then((value) => print(value));
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/logo.png',
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _menuItem(
                  'Contatos',
                  Icons.contacts,
                  onTap: () {
                    _showContatctList(context);
                  },
                ),
                _menuItem(
                  'Transferencias feed',
                  Icons.attach_money,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransferenciasFeed()));
                  },
                ),
//                _menuItem(
//                  'Transferencias', Icons.attach_money,
//                    onTap: () {
//                      Navigator.of(context).push(MaterialPageRoute(
//                      builder: (context) => ListaTransferencias()));
//                    },
//                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showContatctList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ListContatos()),
    );
  }
}

class _menuItem extends StatelessWidget {
  final String menuName;
  final IconData menuIcon;
  final Function onTap;

  _menuItem(this.menuName, this.menuIcon, {@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            this.onTap();
          },
          child: Container(
            width: 180,
            height: 110,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  this.menuIcon,
                  size: 24,
                  color: Colors.white,
                ),
                Text(this.menuName,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
