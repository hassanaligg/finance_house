import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/common_widgets/custom_svg.dart';


class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final BoxDecoration decoration;
  final String icon;
  final double? size;
  final Color? color;
  final EdgeInsets? padding;

  const AppIconButton({
    super.key,
    required this.onTap,
    required this.decoration,
    required this.icon,
    this.color,
    this.size,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        decoration: decoration,

        child: Padding(
          padding:padding ?? EdgeInsets.all(8.sp),
          child: CustomSvgIcon(
            icon,
            size: size ?? 20.sp,
            color:color,
          ),
        ),
      ),
    );
  }
}
