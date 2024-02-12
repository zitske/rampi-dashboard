import 'dart:ui';

String inclinacaoText(int num) {
  if (num == 0) {
    return "Muita";
  } else if (num == 1) {
    return "Média";
  } else if (num == 2) {
    return "Pouca";
  } else {
    return "Não avaliado";
  }
}

Color conditionColor(int num) {
  if (num == 0) {
    return Color(0xFFFF0000);
  } else if (num == 1) {
    return Color(0xFFFFE500);
  } else if (num == 2) {
    return Color(0xFF80FF00);
  } else {
    return Color(0xFFFFFFFF);
  }
}

String conditionText(int num) {
  if (num == 0) {
    return "Péssima";
  } else if (num == 1) {
    return "Razoável";
  } else if (num == 2) {
    return "Pouca";
  } else {
    return "Ótima";
  }
}
