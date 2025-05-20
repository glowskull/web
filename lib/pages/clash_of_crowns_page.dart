import 'package:flutter/material.dart';
import '../ui_helper.dart';
import 'widgets/desktop_appbar.dart';
import 'widgets/mobile_appbar.dart';

class ClashOfCrownsPage extends StatelessWidget {
  const ClashOfCrownsPage({Key? key}) : super(key: key);

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
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Clash of Crowns",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Get a crown and crash it.",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
