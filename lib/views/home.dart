import 'package:flutter/material.dart';
import 'package:tic_tac/models/game.dart';
import 'package:tic_tac/core/theme/style_color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String lastValue = "x";
  bool gameOver = false;
  int turn = 0;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  Game game = Game();

  @override
  void initState() {
    game.board = Game.initGameBoad();
    print(game.board);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tuc tac"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "it's $lastValue turn".toUpperCase(),
            style: const TextStyle(
              fontSize: 58,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: boardWidth,
            width: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardLength ~/ 3,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(Game.boardLength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == "") {
                            setState(() {
                              game.board![index] = lastValue;
                              turn++;
                              gameOver = game.winnerCheck(
                                  lastValue, index, scoreboard, 3);
                              if (gameOver) {
                                result = '$lastValue is winner';
                              } else if (!gameOver && turn == 9) {
                                result = "it's it Draw!";
                                gameOver = true;
                              }
                              if (lastValue == "x") {
                                lastValue = "o";
                              } else {
                                lastValue = "x";
                              }
                            });
                          }
                        },
                  child: Container(
                    height: Game.boardSize,
                    width: Game.boardSize,
                    decoration: BoxDecoration(
                      color: MainColor.secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                            color: game.board![index] == "x"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 54, color: Colors.white),
          ),
          //myButton(),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                game.board = Game.initGameBoad();
                lastValue = "x";
                turn = 0;
                result = "";
                scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            icon: const Icon(
              Icons.replay,
            ),
            label: const Text("restart"),
          ),
        ],
      ),
    );
  }

  Widget myButton() {
    return ElevatedButton.icon(
      onPressed: () async {
        var news = await Game.initGameBoad();
        setState(() {
          game.board = Game.initGameBoad();
          lastValue = "x";
          turn = 0;
          result = "";
          scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
          news;
        });
      },
      icon: const Icon(
        Icons.replay,
      ),
      label: const Text("restart"),
    );
  }
}
