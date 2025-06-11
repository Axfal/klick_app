import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'provider/search_bar_provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBarProvider>(
      builder: (context, searchProvider, child) {
        return Container(
          height: 40.h, // Total preferred height
          padding: EdgeInsets.symmetric(horizontal: 12.w),

          child: Row(
            children: [
              /// SCAN ICON
              Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.qr_code_scanner,
                  size: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10.w),

              /// SEARCH BAR
              Expanded(
                child: Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      /// TEXT FIELD
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            searchProvider.searchQuery = value;
                          },
                          style: TextStyle(fontSize: 12.sp),
                          decoration: InputDecoration(
                            hintText: "Search Product...",
                            hintStyle: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 12.sp,
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),

                      /// CAMERA ICON
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 18.sp,
                        color: Colors.black,
                      ),

                      SizedBox(width: 6.w),

                      /// SEARCH BUTTON
                      Container(
                        height: 28.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
