import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 2},
        {'texto': 'Vermelho', 'nota': 3},
        {'texto': 'Verde', 'nota': 4},
        {'texto': 'Branco', 'nota': 6},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 2},
        {'texto': 'Cobra', 'nota': 3},
        {'texto': 'Elefante', 'nota': 4},
        {'texto': 'Leão', 'nota': 6},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 2},
        {'texto': 'João', 'nota': 3},
        {'texto': 'Leo', 'nota': 4},
        {'texto': 'Pedro', 'nota': 6},
      ],
    }
  ];

  void _responder(int notaResposta) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += notaResposta;
      });
    }
  }

  void _reniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Projeto perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
                temPerguntaSelecionada: temPerguntaSelecionada)
            : Resultado(
                pontuacaoTotal: _pontuacaoTotal,
                reniciar: _reniciar,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
