
import 'package:bytebank/main.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

class ListaDeTransferenciaState extends State<ListaDeTransferencia>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return CardItem(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //navigator para navegar entre as telas
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return Formulario();
          }));
          future.then((transferenciaRecebida){
            debugPrint('$transferenciaRecebida');
            //update the list in the screen
            setState(() {
              if(transferenciaRecebida != null){
                widget._transferencias.add(transferenciaRecebida);
              }
            });
          });

        },
      ),
    );
  }

}

/**
 * Tela de Lista que mostra as lista de transação
 * */
class ListaDeTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = List();
  @override
  State<StatefulWidget> createState() {
    return ListaDeTransferenciaState();
  }
}

class CardItem extends StatelessWidget {

  final Transferencia _transferencia;

  CardItem(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.descricao.toString()),
        subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}