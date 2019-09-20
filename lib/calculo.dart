import 'package:flutter/material.dart';
import 'package:trab_bruno_flutter/alert.dart';

GlobalKey<FormState> key = new GlobalKey();
bool validade = false;
final campo1 = new TextEditingController();
final campo2 = new TextEditingController();

class Calculo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15),
          child: new Form(
            child: buildScreen(context),
            autovalidate: validade,
            key: key,
          ),
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Campo 1'),
          maxLength: 10,
          validator: validateName,
          keyboardType: TextInputType.number,
          controller: campo1,
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Campo 2'),
          maxLength: 10,
          keyboardType: TextInputType.number,
          validator: validateName,
          controller: campo2,
        ),
        new Row(
          children: <Widget>[
            new ButtonTheme(
              minWidth: 50,
              child: new RaisedButton(
                onPressed: () {
                  calcular(context, "+");
                },
                child: Text('+'),
              ),
            ),
            new ButtonTheme(
              minWidth: 50,
              child: new RaisedButton(
                onPressed: () {
                  calcular(context, "-");
                },
                child: Text('-'),
              ),
            ),
            new ButtonTheme(
              minWidth: 50,
              child: new RaisedButton(
                onPressed: () {
                  calcular(context, "*");
                },
                child: Text('*'),
              ),
            ),
            new ButtonTheme(
              minWidth: 50,
              child: new RaisedButton(
                onPressed: () {
                  calcular(context, "/");
                },
                child: Text('/'),
              ),
            ),
          ],
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Voltar!'),
        ),
      ],
    );
  }

  void sendFormulario() {
    if (key.currentState.validate()) {
      key.currentState.save();
    }
  }

  String validatePhone(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o campo";
    } else if (value.length != 10) {
      return "O Celular deve ter 10 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular deve conter apenas dígitos";
    }
    return null;
  }

  String validateName(String value) {
    if (value.length == 0) {
      return "Informe o campo";
    }
    return null;
  }

  void calcular(BuildContext context, String operacao) {
    if (key.currentState.validate()) {
      double result = 0;
      switch (operacao) {
        case '*':
          result = double.parse(campo1.text) * double.parse(campo2.text);
          break;
        case '/':
          if (double.parse(campo1.text) > 0 && double.parse(campo2.text) > 0)
            result = double.parse(campo1.text) / double.parse(campo2.text);
          else
            result = 0;
          break;
        case '+':
          result = double.parse(campo1.text) + double.parse(campo2.text);
          break;
        case '-':
          result = double.parse(campo1.text) - double.parse(campo2.text);
          break;
        default:
          result = 0;
      }

      new Alert().showAlertDialog(context, "Resultado: " + result.toString());
    }
  }
}
