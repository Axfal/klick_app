// widgets/delivery_info_card.dart
import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/pages/Home/widgets/slider/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../constants/colors.dart';
// import 'rounded_card.dart';

class DeliveryInfoCard extends StatelessWidget {
  const DeliveryInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      backgroundColor: AppColors.lightAmbaer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.access_time, size: 24.sp, color: AppColors.iconColor),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Time",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Text(
                    "2 Hrs ⚡",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.5.sp,
                      color: AppColors.orangeColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              "Shop Now",
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            ),
          ),
        ],
      ),
    );
  }
}
