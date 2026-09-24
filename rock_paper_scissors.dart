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
