import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( //template
        body: Formulario(),
      ),
    );
  }
}

class Formulario extends StatelessWidget {

  final TextEditingController _controladorNomeProduto = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorNomeProduto,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
              ),
            ),
          ), Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorValor,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor do Produto',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              final String nomeProd = _controladorNomeProduto.text;
              final int valorProd = int.tryParse(_controladorValor.text);
              if(nomeProd != null && valorProd != null){
                final trans = Transferencia(nomeProd, valorProd);
                debugPrint("${trans.valor}");
              }
            },
            child: Text('Confirmar', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}


class ListaDeTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: CardItem(Transferencia("Produto", 1300)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
      ),
    );
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

class Transferencia{

  final String descricao;
  final int valor;

  Transferencia(this.descricao, this.valor);

  @override
  String toString() {
    return 'Transferencia{descricao: $descricao, valor: $valor}';
  }
}
