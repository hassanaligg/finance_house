import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';
class InitialsCard extends StatelessWidget {
  final String name;
  final double radius;
  final Color? bgColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  const InitialsCard({super.key,
    required this.name,
     this.borderColor,
     this.padding,
    required this.radius, this.bgColor, this.textStyle,
  });

  String getInitials(String name) {
    List<String> nameParts = name.split(" ");

    if(name.length==1){
      return name;
    }
    if (nameParts.length == 1) {
      return nameParts[0].substring(0, 2).toUpperCase();
    } else {
      return (nameParts[0][0] + nameParts[1][0]).toUpperCase();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: bgColor?? AppColors.greyColor,
        borderRadius: BorderRadius.circular(radius), // Rounded corners
        border: Border.all(
          color: borderColor ?? AppColors.greyColor, // Border color
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 6,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Text(
        getInitials(name),
        style: textStyle?? AppTextStyles.textMedium14,
      ),
    )
    ;
  }
}
