import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Tiles extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;

  const Tiles({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 60),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.bebasNeue(
              fontSize: 16.sp,
              color: AppColors.whiteColor,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
