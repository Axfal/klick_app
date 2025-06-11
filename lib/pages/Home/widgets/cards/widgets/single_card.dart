import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color? backgroundColor;
  final Color? textColor;

  const SingleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.cardColor,
        //  Colors.amber.shade50,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20.sp,
                    color: textColor ?? AppColors.whiteColor,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: textColor ?? AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Image.asset(imagePath, height: 80.h, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
