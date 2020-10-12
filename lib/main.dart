import 'dart:convert';

import 'package:bytebank/models/lista_usuarios.dart';
import 'package:bytebank/screens/login.dart';
import 'package:bytebank/screens/transferencias/formulario.dart';
import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/material.dart';

import 'apis/api.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary
          )

      ),
      home: ListaDeTransferencia(),
    );
  }

}

/*
class ListViewJson extends StatefulWidget {

  @override
  _ListViewJsonState createState() => _ListViewJsonState();
}

class _ListViewJsonState extends State<ListViewJson> {

  var users = new List<ListaUsuarios>();

  _getUsers(){
    API.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => ListaUsuarios.fromJson(model)).toList();
      });
    });
  }

  _ListViewJsonState(){
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List view'),
      ),
      body: listaUsuarios(),
    );
  }

  listaUsuarios() {

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i){
          return ListTile(
            title: Text(
              users[i].name,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),

          );
        });
  }

}
*/






