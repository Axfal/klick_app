import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color? backgroundColor;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.213,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          /// Text Content
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20.sp,
                    color: AppColors.whiteColor,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),

          /// Image or Lottie
          Positioned(
            bottom: 0,
            right: 0,
            child: imagePath.toLowerCase().endsWith('.json')
                ? Lottie.asset(
                    imagePath,
                    height: 55.h,
                    fit: BoxFit.cover,
                    repeat: true,
                  )
                : Image.asset(imagePath, height: 58.h, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
