import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/pages/widgets/desktop_appbar.dart';
import 'package:responsive_product_web_page/pages/widgets/mobile_appbar.dart';
import '../ui_helper.dart';
import 'widgets/app_logo.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Column(
          children: [
            if (screenType == ScreenType.desktop)
              const DesktopAppBar()
            else
              MobileAppBar(onPressed: () {}, isDrawerOpened: false),

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
