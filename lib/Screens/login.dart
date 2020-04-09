import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_layout/Models/token.dart';
import 'package:http/http.dart' as http;
import 'package:play_layout/Services/loginService.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState(new LoginService());
}

class _LoginState extends State<Login> {
  final LoginService loginService;

  _LoginState(this.loginService);

  @override
  void initState() {
    super.initState();
  }

  var emailController = TextEditingController(text: 'admin@vr.com.br');
  var passwordController = TextEditingController(text: '1234');

  void doLogin() async {
    try {
      final String email = emailController.text;
      final String password = passwordController.text;

      final token = await loginService.doAuth(email, password);

      await loginService.saveToken(token.token);

      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print('****************' + e.toString());
      showAlert();
    }
  }

  void showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Não foi possivel entrar'),
            content: Text('Corpo aqui oh'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Play Layout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.mail),
                    labelText: 'Email *',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.security),
                    labelText: 'Senha *',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {
                    doLogin();
                  },
                  child: Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Entrar'),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              Colors.purple,
                            ),
                            strokeWidth: 3.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  color: Colors.tealAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
