
import 'package:flutter/material.dart';
import '../ui_helper.dart';
import 'widgets/desktop_appbar.dart';
import 'widgets/mobile_appbar.dart';

class ChibiChessPage extends StatelessWidget {
  const ChibiChessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenType = context.screenType();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (screenType == ScreenType.desktop)
              const DesktopAppBar()
            else
              MobileAppBar(
                onPressed: () => Navigator.pop(context),
                isDrawerOpened: false,
              ),
            Expanded(
              child: Center(
                child: Text(
                  "Chibi Chess",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
