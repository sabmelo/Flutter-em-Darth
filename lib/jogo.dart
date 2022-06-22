import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("imagens/nada.jpeg");
  var _mensagemVencedor = '';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = [
      'PEDRA',
      'PAPEL',
      'TESOURA'
    ];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do APP:" + escolhaApp);
    print("Escolha do usuário:" + escolhaUsuario);

    switch (escolhaApp) {
      case 'PEDRA':
        setState(() {
          _imageApp = AssetImage("imagens/pedra.jpeg");
        });
        break;
      case 'PAPEL':
        setState(() {
          _imageApp = AssetImage("imagens/papel.jpeg");
        });
        break;
      case 'TESOURA':
        setState(() {
          _imageApp = AssetImage("imagens/tesoura.jpeg");
        });
        break;
    }

    //Logica do vencedor
    if ((escolhaUsuario == 'PEDRA' && escolhaApp == 'TESOURA') || (escolhaUsuario == 'TESOURA' && escolhaApp == 'PAPEL') || (escolhaUsuario == 'PAPEL' && escolhaApp == 'PEDRA')) {
      print("Você venceu :)");
    } else if ((escolhaUsuario == 'TESOURA' && escolhaApp == 'PEDRA') || (escolhaUsuario == 'PAPEL' && escolhaApp == 'TESOURA') || (escolhaUsuario == 'PEDRA' && escolhaApp == 'PAPEL')) {
      _mensagemVencedor = "Você perdeu :(";
    } else {
      _mensagemVencedor = "Empate :0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo :)"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do APP :)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imageApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo :)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _opcaoSelecionada('PEDRA'),
                  child: Image.asset(
                    "imagens/pedra.jpeg",
                    height: 90,
                  )),
              GestureDetector(
                  onTap: () => _opcaoSelecionada('PAPEL'),
                  child: Image.asset(
                    "imagens/papel.jpeg",
                    height: 90,
                  )),
              GestureDetector(
                  onTap: () => _opcaoSelecionada('TESOURA'),
                  child: Image.asset(
                    "imagens/tesoura.jpeg",
                    height: 90,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagemVencedor,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
