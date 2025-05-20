class Game {
  final String title;
  final String route;
  final String description;

  const Game({
    required this.title,
    required this.route,
    required this.description,
  });
}

const List<Game> kGames = [
  Game(
    title: 'Chibi Chess',
    route: 'chibi-chess',
    description: "It's Chibi and it's Chess!",
  ),
  Game(
    title: 'Clash of Crowns',
    route: 'clash-of-crowns',
    description: "Get a crown and crash it.",
  ),
];