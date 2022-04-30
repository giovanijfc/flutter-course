import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';

class Resultado extends StatelessWidget {
  final pontuacaoTotal;
  final void Function() reniciar;

  Resultado({
    required this.pontuacaoTotal,
    required this.reniciar,
  });

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns';
    } else if (pontuacaoTotal < 12) {
      return 'Você é bom!';
    } else if (pontuacaoTotal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Center(
        child: Column(
          children: [
            Text(
              '$fraseResultado',
              style: TextStyle(fontSize: 42),
            ),
            Text(
              'Sua nota foi $pontuacaoTotal!',
              style: TextStyle(fontSize: 28),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Resposta('Voltar ao ínicio', reniciar),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
