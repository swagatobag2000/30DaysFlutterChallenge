import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tictoctoegame/custom_dialogue.dart';
import 'game_button.dart';

class GamePage extends StatefulWidget {
  static const String id = "GamePage";
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GameButton> buttonsList;
  List<int> player1;
  List<int> player2;
  var activePlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9)
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enable = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => CustomDialogue("Game Tied",
                  "Press the reset button to start again.", resetGame));
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3))
      winner = 1;
    if (player2.contains(1) && player2.contains(2) && player2.contains(3))
      winner = 2;
    if (player1.contains(4) && player1.contains(5) && player1.contains(6))
      winner = 1;
    if (player2.contains(4) && player2.contains(5) && player2.contains(6))
      winner = 2;
    if (player1.contains(7) && player1.contains(8) && player1.contains(9))
      winner = 1;
    if (player2.contains(7) && player2.contains(8) && player2.contains(9))
      winner = 2;
    if (player1.contains(1) && player1.contains(4) && player1.contains(7))
      winner = 1;
    if (player2.contains(1) && player2.contains(4) && player2.contains(7))
      winner = 2;
    if (player1.contains(2) && player1.contains(5) && player1.contains(8))
      winner = 1;
    if (player2.contains(2) && player2.contains(5) && player2.contains(8))
      winner = 2;
    if (player1.contains(3) && player1.contains(6) && player1.contains(9))
      winner = 1;
    if (player2.contains(3) && player2.contains(6) && player2.contains(9))
      winner = 2;
    if (player1.contains(1) && player1.contains(5) && player1.contains(9))
      winner = 1;
    if (player2.contains(1) && player2.contains(5) && player2.contains(9))
      winner = 2;
    if (player1.contains(3) && player1.contains(5) && player1.contains(7))
      winner = 1;
    if (player2.contains(3) && player2.contains(5) && player2.contains(7))
      winner = 2;
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialogue("Player 1 Won",
                "Press Reset Button to Start Again", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialogue("Player 2 Won",
                "Press Reset Button to Start Again", resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      Navigator.pushNamed(context, GamePage.id);
    }
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0,
                  childAspectRatio: 0.6),
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
//                height: 200.0,
                child: RaisedButton(
                  color: buttonsList[i].bg,
                  disabledColor: buttonsList[i].bg,
                  onPressed: () {
                    if (buttonsList[i].enable) {
                      playGame(buttonsList[i]);
                    }
                  },
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    buttonsList[i].text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 120.0,
                    ),
                  ),
                ),
              ),
              itemCount: buttonsList.length,
            ),
          ),
          RaisedButton(
            onPressed: resetGame,
            padding: EdgeInsets.all(20.0),
            color: Colors.green,
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
          )
        ],
      ),
    );
  }
}
