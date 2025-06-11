import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum GridCardVariant { large, small }

class GridItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final GridCardVariant variant;
  final Color? backgroundColor;

  const GridItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.variant,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isLarge = variant == GridCardVariant.large;
    return Container(
      height: isLarge ? 175.h : 84.5.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.cardColor,
        // const Color.fromARGB(197, 252, 198, 198),
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
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20.sp,
                    color: AppColors.whiteColor,
                    letterSpacing: 1.2,
                  ),
                ),
                // SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.whiteColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // SizedBox(width: 10.w),
                if (isLarge)
                  Image.asset(imagePath, height: 105.h, fit: BoxFit.contain),
              ],
            ),
          ),
          if (!isLarge)
            Image.asset(imagePath, height: 100.h, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
