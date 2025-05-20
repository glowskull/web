import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';

import '../../constants/menu_items.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColors.grey,
      width: double.infinity,
      child: Column(children: [
        for (final item in kAppMenuItems)
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, item.route);
            },
            child: Text(item.title.toUpperCase()),
          ),
      ]),
    );
  }
}
