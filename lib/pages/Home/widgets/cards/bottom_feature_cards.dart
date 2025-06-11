import 'package:klik_app/pages/Home/widgets/cards/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomFeatureCards extends StatelessWidget {
  const BottomFeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeatureCard(
            title: "Web Exclusives",
            subtitle: "Exclusive Finds, Only Online 💼",
            imagePath: "assets/images/medicine.png",
            // backgroundColor: AppColors.primaryColor,
            //  const Color.fromARGB(197, 252, 198, 198),
            // AppColors.cyan,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: FeatureCard(
            title: "Clearance Outlet",
            subtitle: "These deals are worth the click! 💥",
            imagePath: "assets/images/product4.png",
            // backgroundColor: AppColors.primaryColor,
            //  const Color.fromARGB(197, 252, 198, 198),
            // backgroundColor: AppColors.lightTeal,
          ),
        ),
      ],
    );
  }
}
