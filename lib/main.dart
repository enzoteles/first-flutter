import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( //template
        body: ListaDeTransferencia(),
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

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final IconData icone;
  Editor({this.controlador, this.rotulo, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        obscureText: false,
        decoration: InputDecoration(
          labelText: rotulo,
          icon: icone != null ? Icon(icone) : null
        ),
      ),
    );
  }
}

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
            setState(() {
              widget._transferencias.add(transferenciaRecebida);
            });
          });

        },
      ),
    );
  }

}

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

class Transferencia{

  final String descricao;
  final int valor;

  Transferencia(this.descricao, this.valor);

  @override
  String toString() {
    return 'Transferencia{descricao: $descricao, valor: $valor}';
  }
}
