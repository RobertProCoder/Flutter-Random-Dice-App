import 'package:flutter/material.dart';
import 'package:diceapplication/about-page.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Text("Dice Application"),
          centerTitle: true,
        ),
        body: Center(child: Dice()),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _CounterState();
}

class _CounterState extends State<Dice> {
  var diceRoll = 1;
  void rollDice() {
    setState(() {
      diceRoll = Random().nextInt(7);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'my-hero',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/dice-images/dice-$diceRoll.png',
            width: 200,
          ),
          SizedBox(height: 100.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: rollDice,
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 15, 121, 159)),
                  child: const Text(
                    'Roll Dice',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(width: 20.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AboutPage()));
                  },
                  child: const Text("Click Me"))
            ],
          )
        ],
      ),
    );
  }
}
