//formulartio de transferencia com criador de transferencia
//possui dois Editor() para inserir valores e botao
import 'package:flutter/material.dart';
import 'package:mobile/components/editor.dart';
import 'package:mobile/models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloCampoNumeroConta = 'Número da conta!';
const _dicaCampoNumeroConta = '0000';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criartransferencia(context),
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criartransferencia(BuildContext context) {
    debugPrint('Clicou em confirmar');

    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciacriada = Transferencia(valor, numeroConta);

      debugPrint('$transferenciacriada');
      Navigator.pop(context, transferenciacriada);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transferencia Criada com sucesso'),
        ),
      );
    } else
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('TRANSFERENCIA NAO CRIADA'),
        ),
      );
  }
}
