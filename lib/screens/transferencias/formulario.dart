
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormularioState();
}

class FormularioState extends State<Formulario> {

  final TextEditingController _controladorNomeProduto = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorNomeProduto,
                rotulo: "Nome Produto"),
            Editor(
                controlador: _controladorValor,
                rotulo: "Valor Produto",
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String nomeProd = _controladorNomeProduto.text;
    final int valorProd = int.tryParse(_controladorValor.text);
    if(nomeProd != null && valorProd != null){
      final trans = Transferencia(nomeProd, valorProd);
      Navigator.pop(context, trans);
      /* Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('$trans'),
        ),
      );*/
    }
  }

}