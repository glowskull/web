import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/pages/widgets/app_drawer.dart';
import 'package:responsive_product_web_page/pages/widgets/desktop_appbar.dart';
import 'package:responsive_product_web_page/pages/widgets/mobile_appbar.dart';
import '../ui_helper.dart';
import 'widgets/app_logo.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    if (_isDrawerOpen) {
      Navigator.of(context).pop(); // Closes the drawer.
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
    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Glowskull makes games.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );

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
              child: screenType == ScreenType.desktop
                  ? Row(
                children: [
                  const Expanded(child: AppLogo(height: 300)),
                  Expanded(child: content),
                ],
              )
                  : SingleChildScrollView(child: content),
            ),
          ],
        ),
      ),
    );
  }
}
