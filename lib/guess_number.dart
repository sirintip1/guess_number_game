// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'game.dart';

void main() {
  var game = MyGame();

  while(true){
    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');
    var guessCount = 0;
    var isCorrect = false;
    do {
      stdout.write('║ Guess the number between 1 and ${MyGame.maxRandom}: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null) {
        continue;
      }
      guessCount++;
      if (game.doGuess(guess) == 1) {
        print('║ ➜ $guess is TOO HIGH! ▲');
        print('╟────────────────────────────────────────');
      } else if (game.doGuess(guess) == -1) {
        print('║ ➜ $guess is TOO LOW! ▼');
        print('╟────────────────────────────────────────');
      } else {
        print('║ ➜ $guess is CORRECT ❤️, total guesses: $guessCount');
        print('╟────────────────────────────────────────');
        isCorrect = true;
      }
    } while (!isCorrect);

    print('║                 THE END                ');
    print('╚════════════════════════════════════════');

    var get = "";
    while(true){
      stdout.write('play again? (Y/N): ');
      get = stdin.readLineSync()!;
      if(get.toUpperCase()=='Y'){
        break;
      }
      else if(get.toUpperCase()=='N'){
        exit (0);
      }
    }
    game = MyGame();
  }
}