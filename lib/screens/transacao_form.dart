import 'package:appcontabancaria/models/enums/tipo_transacao.dart';
import 'package:appcontabancaria/models/transacao.dart';
import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final Transacao? transacao;
  final TextEditingController _ctrValor = TextEditingController();

  TransacaoForm({
    super.key,
    this.transacao,
  });

  @override
  State<StatefulWidget> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  TipoTransacao? _selectedTipoTransacao;

  @override
  void initState() {
    super.initState();
    if (widget.transacao != null) {
      widget._ctrValor.text = widget.transacao!.valor.toString();
      _selectedTipoTransacao = widget.transacao!.tipo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transacao == null
            ? 'Nova transação'
            : 'Editar transação'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: widget._ctrValor,
                    decoration: const InputDecoration(labelText: "Valor da transação:"),
                  ),
                  DropdownButton<TipoTransacao>(
                    isExpanded: true,
                    value: _selectedTipoTransacao,
                    hint: const Text("Selecione o tipo de transação:"),
                    onChanged: (TipoTransacao? newValue){
                      setState(() {
                        _selectedTipoTransacao = newValue;
                      });
                    },
                    items: TipoTransacao.values.map((TipoTransacao tipo) {
                        return DropdownMenuItem<TipoTransacao>(
                          value: tipo,
                          child: Text(tipo.name)
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.transacao == null) {
                  _criarTransacao(context);
                } else {
                  _editarTransacao();
                }
              },
              child: const Text("Confirmar"),
            )
          ],
        ),
      ),
    );
  }

  void _criarTransacao(BuildContext context) {
    final double? valorTransacao = double.tryParse(widget._ctrValor.text);

    if (valorTransacao != null && _selectedTipoTransacao != null) {
      final transacao = Transacao(
        _selectedTipoTransacao!, 
        valorTransacao);
      Navigator.pop(context, transacao);
    }
  }

  void _editarTransacao() {
    final double? valorTransacao = double.tryParse(widget._ctrValor.text);

    if (valorTransacao != null && widget.transacao != null) {
      setState(() {
        widget.transacao!.valor = valorTransacao;
        widget.transacao!.tipo = _selectedTipoTransacao!;
      });
      Navigator.pop(context, widget.transacao);
    }
  }
}
