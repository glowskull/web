import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;

  const AppLogo({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: width,
      height: height,
      color: color,
      colorBlendMode: BlendMode.srcIn,
    );
    return Image.asset(
      "assets/images/logo.png",
      height: 33,
    );
  }
}
