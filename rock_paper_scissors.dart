/// A simple Rock, Paper, Scissors game for two players in Dart.
import 'dart:io';

/// Tulo ka valid nga mga pilianan sa duwa.
const List<String> mgaPilianan = ['rock', 'paper', 'scissors'];

/// Print ang welcome banner sa console.
void printAngBanner() {
  print('===== ROCK, PAPER, SCISSORS =====');
}

/// Print ang 30 ka blank lines para dili makita sa Player 2 ang gipili sa Player 1.
void clearScreenNako() {
  for (int i = 0; i < 30; i++) {
    print('');
  }
}

/// Mag ask sa players sa ilang mga pangalan ug i-return. Gamiton ang defaultName kung walay input.
String kuhaonAngPangalanSaPlayer(String promptNgaText, String defaultNgaName) {
  stdout.write(promptNgaText);
  String? angGisulod = stdin.readLineSync();
  String pangalan = angGisulod?.trim() ?? '';
  if (pangalan.isEmpty) {
    print('(No name entered. Using "$defaultNgaName".)');
    return defaultNgaName;
  }
  return pangalan;
}

/// Return ang valid nga move kung valid ang input, otherwise return null.
String? validateSiMove(String? angGisulod) {
  String lihok = angGisulod?.trim().toLowerCase() ?? '';
  if (mgaPilianan.contains(lihok)) {
    return lihok;
  }
  return null;
}

/// Ask sa player sa ilang move ug i-return ang valid nga move. Mag loop hangtod makakuha og valid input.
String getSiMove(String pangalanSaPlayer) {
  String? lihok;
  while (lihok == null) {
    stdout.write('$pangalanSaPlayer, enter your move (rock/paper/scissors): ');
    String? angGisulod = stdin.readLineSync();
    lihok = validateSiMove(angGisulod);
    if (lihok == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  }
  return lihok;
}

/// Decide kung kinsa ang winner base sa moves sa duha ka players. Return ang winner's name or null kung draw.
String? decideNgWinner(
  String siPlayer1,
  String lihok1,
  String siPlayer2,
  String lihok2,
) {
  if (lihok1 == lihok2) {
    return null;
  }
  switch (lihok1) {
    case 'rock':
      return lihok2 == 'scissors' ? siPlayer1 : siPlayer2;
    case 'paper':
      return lihok2 == 'rock' ? siPlayer1 : siPlayer2;
    case 'scissors':
      return lihok2 == 'paper' ? siPlayer1 : siPlayer2;
    default:
      return null;
  }
}

void main() {
  printAngBanner();

  String siPlayer1 = kuhaonAngPangalanSaPlayer(
    'Enter Player 1 name: ',
    'Player 1',
  );
  String siPlayer2 = kuhaonAngPangalanSaPlayer(
    'Enter Player 2 name: ',
    'Player 2',
  );

  int scoreSaPlayer1 = 0;
  int scoreSaPlayer2 = 0;
  int numberSaRound = 1;
  String? duwaUtro;

  do {
    print('\n--- Round $numberSaRound ---');

    String lihok1 = getSiMove(siPlayer1);
    clearScreenNako();

    String lihok2 = getSiMove(siPlayer2);

    print('$siPlayer1 chose $lihok1. $siPlayer2 chose $lihok2.');

    String? daog = decideNgWinner(siPlayer1, lihok1, siPlayer2, lihok2);

    if (daog != null) {
      print('Result: $daog wins the round!');
      if (daog == siPlayer1) {
        scoreSaPlayer1++;
      } else {
        scoreSaPlayer2++;
      }
    } else {
      print('Result: ${daog ?? "It\'s a draw!"}');
    }

    print('Score -> $siPlayer1: $scoreSaPlayer1 | $siPlayer2: $scoreSaPlayer2');

    stdout.write('Play again? (y/n): ');
    duwaUtro = stdin.readLineSync()?.trim().toLowerCase();
    numberSaRound++;
  } while (duwaUtro == 'y');

  print('\n===== FINAL SCORE =====');
  print('$siPlayer1: $scoreSaPlayer1 | $siPlayer2: $scoreSaPlayer2');

  String overallNgaDaog;
  if (scoreSaPlayer1 > scoreSaPlayer2) {
    overallNgaDaog = siPlayer1;
  } else if (scoreSaPlayer2 > scoreSaPlayer1) {
    overallNgaDaog = siPlayer2;
  } else {
    overallNgaDaog = "It's a tie!";
  }
  print('Overall winner: $overallNgaDaog');
}
