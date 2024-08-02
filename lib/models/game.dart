import 'package:flutter/material.dart';

class Player{
  static const x = "x" ;
  static const o = "O" ;
  static const empty = "" ;
}

class Game extends ChangeNotifier{
  static const boardLength = 9;
  static const boardSize = 100.0;

  List <String>? board;

 static List<String>? initGameBoad()=>List.generate(boardLength, (index) => Player.empty);

 bool winnerCheck(String player,int index,List<int>scoreboard,int gridSize){
   int row = index ~/3;
   int col = index % 3;
   int score = player == "x" ? 1 : -1 ;

   scoreboard[row] += score;
   scoreboard[gridSize + col] += score;

   if(row == col) scoreboard[2 * gridSize] +=score;
   if(gridSize -1 - col == row) scoreboard[2 * gridSize + 1] +=score;
   //checking if we have 3 or -3 in the score board
   if(scoreboard.contains(3) || scoreboard.contains(-3)){
     return true;
   }
    notifyListeners();
   return false;
 }
 static myButton(Game game,String lastValue, int turn,String result, List<int>scoreboard){
   game.board = Game.initGameBoad();
   lastValue ="x";
   turn=0;
   result = "";
   scoreboard=[0,0,0,0,0,0,0,0];
   return Game.initGameBoad();
 }
}

