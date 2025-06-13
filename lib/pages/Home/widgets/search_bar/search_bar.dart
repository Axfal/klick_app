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
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              /// SCAN ICON BUTTON
              Container(
                height: 42.h,
                width: 42.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.qr_code_scanner,
                  size: 22.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10.w),

              /// SEARCH BAR
              Expanded(
                child: Container(
                  height: 42.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// TEXT FIELD
                      Expanded(
                        child: TextField(
                          onChanged: (value) =>
                              searchProvider.searchQuery = value,
                          style: TextStyle(fontSize: 13.sp),
                          decoration: InputDecoration(
                            hintText: "Search products, brands...",
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
                        size: 20.sp,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(width: 8.w),

                      /// SEARCH BUTTON
                      GestureDetector(
                        onTap: () {
                          // Trigger search action if needed
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
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
