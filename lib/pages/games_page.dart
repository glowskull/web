import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/pages/widgets/app_drawer.dart';
import 'package:responsive_product_web_page/pages/widgets/desktop_appbar.dart';
import 'package:responsive_product_web_page/pages/widgets/mobile_appbar.dart';
import '../../ui_helper.dart';
import '../constants/games.dart';
import './widgets/desktop_appbar.dart';
import './widgets/mobile_appbar.dart';
import './widgets/app_drawer.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    if (_isDrawerOpen) {
      Navigator.of(context).pop(); // closes the drawer
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenType = context.screenType();
    final screenWidth = MediaQuery.of(context).size.width;
    const desiredHeight = 400.0;
    final ratio = screenWidth / desiredHeight; // childAspectRatio = width/height.

    return Scaffold(
      key: _scaffoldKey,
      drawer: screenType == ScreenType.mobile ? const Drawer(child: AppDrawer()) : null,
      body: SafeArea(
        child: Column(
          children: [
            if (screenType == ScreenType.desktop)
              const DesktopAppBar()
            else
              MobileAppBar(
                onPressed: _toggleDrawer,
                isDrawerOpened: _isDrawerOpen,
              ),

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
