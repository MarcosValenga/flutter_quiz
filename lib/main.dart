import 'package:flutter/material.dart';
import 'package:flutter_quiz/resultado.dart';
import 'questionario.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor Favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco',  'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal Favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Papagaio', 'pontuacao': 3},
        {'texto': 'Tartaruga',  'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu Instrutor Favorito?',
      'respostas': [
        {'texto': 'Rafael', 'pontuacao': 10},
        {'texto': 'Gabriel', 'pontuacao': 5},
        {'texto': 'Mael', 'pontuacao': 3},
        {'texto': 'Miguel',  'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reinicarQuestionario () {
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
    // List<Widget> respostas = [];
    // for(String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //   respostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          backgroundColor: Colors.blue,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reinicarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
