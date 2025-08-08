import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String path;
  final double? size;
  final Color? color;
  final BoxFit fit;
  final VoidCallback? onPress;

  const CustomSvgIcon(
      this.path, {
        super.key,
        this.size,
        this.color,
        this.onPress,
        this.fit = BoxFit.contain,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SvgPicture.asset(
        path,
        width: size,
        height: size,
        color: color,
        fit: fit,
      ),
    );
  }
}
