import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}


class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorNumeroConta,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0002'
              ),
              keyboardType: TextInputType.number,
            ),
          ),Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                  labelText: 'Valor',
                  icon: Icon(Icons.monetization_on),
                  hintText: '0001'
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              debugPrint('Clicou em confirmar');

              final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
              final double? valor = double.tryParse(_controladorCampoValor.text);

              if(numeroConta != null && valor != null) {
                final transferenciacriada = Transferencia(valor, numeroConta);

                debugPrint('$transferenciacriada');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transferencia Criada com sucesso'),
                  ),
                );
              } else
                debugPrint('transferencia naocriada');

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('TRANSFERENCIA NAO CRIADA'),
                ),
              );

              },
            child: const Text('Confirm'),

          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('transfer'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencias(Transferencia(11111.0, 1000)),
          ItemTransferencias(Transferencia(111.1, 100)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
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
        leading: Icon(Icons.add),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }

}

  class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
  this.valor,
  this.numeroConta,
  );

  @override
  String toString() {
  return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
  }