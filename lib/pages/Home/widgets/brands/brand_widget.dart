import 'package:google_fonts/google_fonts.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/pages/Home/widgets/brands/widgets/home_brand_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/home_brand_provider.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Title with "More" Button**
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Brands",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),

          /// **Category ListView (Horizontal Scroll) using Consumer**
          Consumer<HomeBrandProvider>(
            builder: (context, brandProvider, child) {
              final brands = brandProvider.brands;
              return Container(
                color: AppColors.scaffoldColor,
                height:
                    MediaQuery.of(context).size.height *
                    0.20, // 20% of screen height
                // height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    return HomeBrandList(
                      containerWidth: MediaQuery.of(context).size.width.w,
                      imageUrl: brands[index]['imagePath']!,
                      text: brands[index]['brandName']!,
                      textWeight: FontWeight.bold,
                      textSize: 12.sp,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
