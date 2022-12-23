// ignore_for_file: avoid_print

//import 'dart:developer';
import 'dart:io';
//import 'package:flutter/cupertino.dart';

import 'game.dart';

void main() {
  List<int> myList = [];
  var again;
  var round = 0;

  do {
    stdout.write("Enter a maximum number to random :");

    // print(round);
    var max = int.parse( stdin.readLineSync()! );

    var game = Game(maxRamdom: max);
    late GuessResult guessResult;
    print('╔══════════════════════════════════════════════════');
    print('║              GUESS THE NUMBER              ');
    print('║──────────────────────────────────────────────────');

    do {




      stdout.write('║  Guess the number between 1 and $max : ');
      var input = stdin.readLineSync();

      if (input == null) {
        //print('Error, input is NULL');
        return;
      }

      var guess = int.tryParse(input);

      if (guess == null) {
        //print('Input error, please enter numbers only');
        continue;
      }

      guessResult = game.doGuess(guess);

      if (guessResult == GuessResult.correct) {
        myList.add(game.totalGuesses);
        round++;

        print('║  ➜ $guess is CORRECT ❤, total guesses: ${game.totalGuesses}');
        print('║──────────────────────────────────────────────────');
        print('║                    THE END                       ');
        print('╚══════════════════════════════════════════════════');

      } else if (guessResult == GuessResult.tooHigh) {
        print('║  ➜ $guess is TOO HIGH! ▲');
        print('║──────────────────────────────────────────────────');
      } else {
        print('║  ➜ $guess is TOO LOW! ▼');
        print('║──────────────────────────────────────────────────');
      }

    } while (guessResult != GuessResult.correct);



    while (1>0) {
      stdout.write("Play again? (Y/N): ");
      again = stdin.readLineSync();
      if (again == "y") {
        break;
      } else if (again == "n") {
        break;
      } else {
        continue;
      }
    }
  } while (again == "y");
  print("You've played $round games");

  for(var i=0 ; i < myList.length  ; i++){
    int g= myList[i];
    int r=i+1;

    print("🚀 Game #$r : $g guesses");

  }


}