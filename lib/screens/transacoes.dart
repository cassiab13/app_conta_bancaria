import 'package:appcontabancaria/models/enums/tipo_transacao.dart';
import 'package:appcontabancaria/models/transacao.dart';
import 'package:appcontabancaria/screens/transacao_form.dart';
import 'package:flutter/material.dart';

class Transacoes extends StatefulWidget {
  Transacoes({super.key});
  final List<Transacao> _transacoes = [
    Transacao(TipoTransacao.credito, 200.0),
    Transacao(TipoTransacao.debito, 45.0)
  ];

  @override
  State<StatefulWidget> createState() => _TransacoesState();
}

class _TransacoesState extends State<Transacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transações Bancárias')),
      body: ListView.builder(
        itemCount: widget._transacoes.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(widget._transacoes[index].valor.toString()),
              subtitle: Text(widget._transacoes[index].tipo.name),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TransacaoForm(
                            transacao: widget._transacoes[index]);
                      })).then((transacaoAtualizada) {
                        if (transacaoAtualizada != null) {
                          setState(() {
                            widget._transacoes[index] = transacaoAtualizada;
                          });
                        }
                      });
                    }),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget._transacoes.removeAt(index);
                    });
                  },
                )
              ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransacaoForm();
            })).then((novaTransacao) {
              if (novaTransacao != null) {
                _atualizaTransacoes(novaTransacao);
              }
            });
          }),
    );
  }

  void _atualizaTransacoes(Transacao novaTransacao) {
    setState(
      () {
        widget._transacoes.add(novaTransacao);
      },
    );
  }
}
