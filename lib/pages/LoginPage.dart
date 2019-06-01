import 'package:flutter/material.dart';
import 'package:super_movies/helpers/alerts.dart';
import 'package:super_movies/helpers/navi.dart';
import 'package:super_movies/pages/HomePage.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController(text: "astamatto@gmail.com");
  final _tSenha = TextEditingController(text: "123456");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        TextFormField(
          controller: _tLogin,
          validator: _validateLogin,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            labelText: "Email",
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            hintText: "Digite o seu email",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),

        TextFormField(
          controller: _tSenha,
          validator: _validateSenha,
          obscureText: true,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            hintText: "Digite a sua Senha",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),

        Container(
          height: 46,
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            onPressed: () {
              _onClickLogin(context);
            },
          ),
        ),
      ]),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }

    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    if (text.length <= 2) {
      return "Senha precisa ter mais de 2 números";
    }

    return null;
  }

  void _onClickLogin(context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    if (!_formKey.currentState.validate()) {
      return;
    }

    if (login == 'astamatto@gmail.com' && senha == '123456') {
      push(context, HomePage(), replacement: true);
    } else {
      alert(context, 'Erro de Login', 'email ou senha incorretos!');
    }
  }
}
