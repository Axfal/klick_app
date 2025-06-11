import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBrandList extends StatelessWidget {
  final double containerWidth;
  final String imageUrl;
  final String text;
  final FontWeight textWeight;
  final double textSize;

  const HomeBrandList({
    super.key,
    required this.containerWidth,
    required this.imageUrl,
    required this.text,
    required this.textWeight,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// **Brand Image**
          Container(
            // width: 60.w,
            // height: 60.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.softGreenBG,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: imageUrl.endsWith('.svg')
                ? SvgPicture.asset(
                    imageUrl,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    imageUrl,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
          ),

          /// **Brans Name**
          SizedBox(height: 4.h),
          Text(
            text,
            style: TextStyle(fontSize: textSize, fontWeight: textWeight),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
