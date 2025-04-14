import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: RockPaperScissorsGame(),
    );
  }
}

class RockPaperScissorsGame extends StatefulWidget {
  @override
  _RockPaperScissorsGameState createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  String playerChoice = '❓';
  String computerChoice = '❓';
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = '';

  List<String> choices = ['✊', '✋', '✌'];

  void playGame(String choice) {
    setState(() {
      playerChoice = choice;
      computerChoice = choices[Random().nextInt(3)];

      if (playerChoice == computerChoice) {
        resultMessage = 'It\'s a Tie 😶';
      } else if ((playerChoice == '✊' && computerChoice == '✌') ||
          (playerChoice == '✋' && computerChoice == '✊') ||
          (playerChoice == '✌' && computerChoice == '✋')) {
        resultMessage = 'You Win 🥳';
        playerScore++;
      } else {
        resultMessage = 'You Lose 😢';
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = '🤔';
      computerChoice = '🤔';
      playerScore = 0;
      computerScore = 0;
      resultMessage = 'Let\'s Play!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lets Play Rock-Paper-Scissors',
            style: TextStyle(
              fontSize: 25,
            ),
        
          ),
          SizedBox(height: 120,),
          Text(
            'You: $playerChoice \nComputer: $computerChoice',
            style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
         
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: choices.map((choice) {
              return ElevatedButton(
                onPressed: () => playGame(choice),
                child: Text(choice, style: TextStyle(fontSize: 40)),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
           Text(
            resultMessage,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Your Score: $playerScore',
               style: TextStyle(fontSize: 16,
               fontWeight: FontWeight.bold)),
              Text('Computer Score: $computerScore',
              style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold)),

              ],
      ),

          SizedBox(height: 20),

         IconButton(
          onPressed: resetGame,
           icon: Icon( Icons.refresh))

        
          
        ],
      ),
    );
  }
}
