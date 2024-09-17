import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final TextEditingController controlador = TextEditingController();

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
              child: TextField(
                controller: widget.controlador,
                decoration:
                    const InputDecoration(labelText: "Valor da transação:"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(widget.controlador.text);
                },
                child: const Text("confirmar"))
          ],
        ),
      ),
    );
  }
}
