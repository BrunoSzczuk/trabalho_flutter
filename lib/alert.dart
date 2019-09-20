import 'package:flutter/material.dart';

class Alert {
  showAlertDialog(BuildContext context, String msg) {
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pop((context));
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Resultado'),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
