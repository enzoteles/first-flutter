import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final IconData icone;

  Editor({
    this.controlador,
    this.rotulo,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        obscureText: false,
        decoration: InputDecoration(
            labelText: rotulo, icon: icone != null ? Icon(icone) : null),
      ),
    );
  }
}
