import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/pages/widgets/desktop_appbar.dart';
import 'package:responsive_product_web_page/pages/widgets/mobile_appbar.dart';
import '../constants/games.dart';
import '../ui_helper.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenType = context.screenType();
    final screenWidth = MediaQuery.of(context).size.width;
    const desiredHeight = 400.0;
    final ratio = screenWidth / desiredHeight; // childAspectRatio = width/height.

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (screenType == ScreenType.desktop)
              const DesktopAppBar()
            else
              MobileAppBar(onPressed: () {}, isDrawerOpened: false),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: screenType == ScreenType.desktop
                    ? GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: ratio,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: kGames
                      .map((g) => _GameCard(game: g))
                      .toList(),
                )
                    : ListView.separated(
                  itemCount: kGames.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, i) => _GameCard(game: kGames[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final Game game;
  const _GameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/games/${game.route}'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(game.title,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(game.description),
            ],
          ),
        ),
      ),
    );
  }
}
