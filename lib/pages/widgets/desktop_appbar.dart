import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/widgets/search_bar.dart' as resp;

import '../../app.dart';
import '../../constants/menu_items.dart';
import 'app_logo.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = MyApp.of(context).isDark;

    final remainingWidth = MediaQuery.of(context).size.width - 611;
    const viewsCounts = 2;
    final numberOfVisibleViews = (remainingWidth ~/ 120).clamp(0, viewsCounts);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
      child: Row(
        children: [
          const AppLogo(),
          const Spacer(
            flex: 6,
          ),

          // Old responsive menu:
          // ...[
          //   TextButton(onPressed: () {}, child: const Text("GAMES")),
          //   TextButton(onPressed: () {}, child: const Text("ABOUT")),
          // ].sublist(0, numberOfVisibleViews),
          // Visibility(
          //   visible:
          //       numberOfVisibleViews < viewsCounts && numberOfVisibleViews > 0,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     width: 120,
          //     child: DropdownButtonHideUnderline(
          //       child: DropdownButton(
          //         enableFeedback: false,
          //         itemHeight: 60,
          //         elevation: 0,
          //         isExpanded: true,
          //         iconDisabledColor: Colors.transparent,
          //         focusColor: Colors.transparent,
          //         isDense: true,
          //         style: const TextStyle(
          //             color: AppColors.black,
          //             fontSize: 16,
          //             fontFamily: "BarlowCondensed"),
          //         hint: const Text(
          //           "More",
          //           style: TextStyle(
          //               color: AppColors.black,
          //               fontSize: 16,
          //               fontFamily: "BarlowCondensed"),
          //         ),
          //         items: const [
          //           DropdownMenuItem<String>(
          //             value: "GAMES",
          //             child: Text("ABOUT"),
          //           ),
          //           DropdownMenuItem<String>(
          //             value: "ABOUT",
          //             child: Text("GAMES"),
          //           ),
          //         ].sublist(numberOfVisibleViews, viewsCounts),
          //         onChanged: (value) {},
          //       ),
          //     ),
          //   ),
          // ),
          ...kAppMenuItems.map((item) {
            return TextButton(
              onPressed: () {
                Navigator.pushNamed(context, item.route);
              },
              child: Text(item.title.toUpperCase()),
            );
          }).toList(),
          const Spacer(
            flex: 6,
          ),

          // Old search bar:
          // const SizedBox(height: 30, width: 200, child: resp.SearchBar()),
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
