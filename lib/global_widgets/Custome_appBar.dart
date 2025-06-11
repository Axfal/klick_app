import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klik_app/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final double? elevation;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.onBackPressed,
    this.centerTitle = true,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.elevation = 2,
    this.leading,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.orangeColor,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading ?? 
        (showBackButton 
          ? IconButton(
              icon: Icon(
                Icons.arrow_back, 
                color: iconColor ?? AppColors.whiteColor,
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          color: titleColor ?? AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}