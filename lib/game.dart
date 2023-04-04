import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _appImage = AssetImage("images/moeda_moldura.png");
  var _message = "Escolha uma opção abaixo";

  void _selectedOption(String userChoice) {
    var options = ["cara", "coroa"];
    var randomNumber = Random().nextInt(2);
    var appChoice = options[randomNumber];

    switch (appChoice) {
      case "cara":
        setState(() {
          _appImage = const AssetImage("images/moeda_cara.png");
        });
        break;
      case "coroa":
        setState(() {
          _appImage = const AssetImage("images/moeda_coroa.png");
        });
        break;
    }

    if (appChoice == userChoice) {
      setState(() {
        _message = "Parabéns! Você ganhou (;";
      });
    } else {
      setState(() {
        _message = "Você perdeu );";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cara ou Coroa")),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha do computador",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Image(
          image: _appImage,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            _message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () => _selectedOption("cara"),
                child: Image.asset("images/moeda_cara.png", height: 100)),
            GestureDetector(
                onTap: () => _selectedOption("coroa"),
                child: Image.asset("images/moeda_coroa.png", height: 100)),
          ],
        )
      ]),
    );
  }
}
