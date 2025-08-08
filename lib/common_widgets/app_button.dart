import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onClick;
  final String text;
  final double? width;
  final double? height;
  final Decoration decoration;
  final TextStyle textStyle;
  final EdgeInsets? padding;

  const AppButton({super.key, required this.onClick,required this.text,required this.decoration,required this.textStyle,
    this. padding,
    this.width,
    this.height

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.symmetric(vertical: 19.h,horizontal: 16.w),
        decoration: decoration,
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
