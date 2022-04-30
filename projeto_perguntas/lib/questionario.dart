import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map> perguntas;
  final void Function(int notaResposta) responder;
  final bool temPerguntaSelecionada;

  Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
    required this.temPerguntaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: [
        Questao(
          perguntas[perguntaSelecionada]['texto'],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: respostas!
                .map((resp) => Resposta(
                      resp['texto'],
                      () => responder(resp['nota']),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
