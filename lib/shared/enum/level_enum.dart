
enum Level { facil, medio, dificil, perito }

/*Artifício para criar um keymap e recuperar o valor*/
extension LevelStringExt on String {
  Level get parse => {
    "facil": Level.facil,
    "medio": Level.medio,
    "dificil": Level.dificil,
    "perito": Level.perito
  }[this]!;
}

extension LevelExt on Level {
  String get parse => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito"
  }[this]!;
}
