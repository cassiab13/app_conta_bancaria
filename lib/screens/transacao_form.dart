import 'package:appcontabancaria/models/enums/tipo_transacao.dart';
import 'package:appcontabancaria/models/transacao.dart';
import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final TextEditingController _ctrValor = TextEditingController();
  final TextEditingController _ctrTipo = TextEditingController();

  TransacaoForm({super.key});

  @override
  State<StatefulWidget> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário Transações Bancárias')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: widget._ctrValor,
                      decoration: const InputDecoration(
                          labelText: "Valor da transação:"),
                    )
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  _criarTransacao(context);
                },
                child: const Text("confirmar"))
          ],
        ),
      ),
    );
  }

  void _criarTransacao(BuildContext context) {
    final double? valorTransacao = double.tryParse(widget._ctrValor.text);

    if (valorTransacao != null) {
      final transacao = Transacao(TipoTransacao.credito, valorTransacao);
      Navigator.pop(context, transacao);
    }
  }
}
