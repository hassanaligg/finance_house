import 'package:finance_house/common_widgets/custom_svg.dart';
import 'package:finance_house/resources/app_text_styles.dart';
import 'package:finance_house/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: AppBar(
        elevation: 0,

        leading: CustomSvgIcon(
          Assets.icons.back,
          onPress: () {
            context.pop(); // or Navigator.of(context).pop()
          },
        ),
        leadingWidth: 18.w,
        title: Text(
          title,
          style: AppTextStyles.textBold18,
        ),
      ),
    );
  }
}
