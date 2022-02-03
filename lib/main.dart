import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: ListaTransferencias(),
    appBar: AppBar(
      title: Text('New transfer'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {  },
      backgroundColor: Colors.blueGrey,
      child: Icon(Icons.add),
    ),
  ),
));

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ItemTransferencias(Transferencia(999.0, 1000)),
        ItemTransferencias(Transferencia(111.1, 100)),




      ],
    );
  }
}

class ItemTransferencias extends StatelessWidget{

 final Transferencia _transferencia;

 ItemTransferencias(this._transferencia);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }

}

class Transferencia{
  final double valor;
  final double conta;

  Transferencia(this.valor, this.conta);
}