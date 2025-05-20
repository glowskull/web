import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/pages/widgets/app_logo.dart';

import '../../app.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar(
      {super.key, required this.onPressed, required this.isDrawerOpened});
  final VoidCallback onPressed;
  final bool isDrawerOpened;
  @override
  Widget build(BuildContext context) {
    final isDark = MyApp.of(context).isDark;

    //return AppBar();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
      child: Row(
        children: [
          IconButton(
              splashRadius: 1,
              onPressed: onPressed,
              icon: isDrawerOpened
                  ? const Icon(Icons.close)
                  : const Icon(Icons.menu)),
          const Spacer(),
          const AppLogo(height: 42),
          const Spacer(),
          const Spacer(),
          // TextButton(onPressed: () {}, child: const Text("SIGN IN")),
          // IconButton(
          //     onPressed: () {},
          //     icon: Image.asset(
          //       "assets/images/cart.png",
          //       height: 20,
          //       width: 20,
          //     )),
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => MyApp.of(context).toggleTheme(),
          ),
        ],
      ),
    );
  }
}
