import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingComponent {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
