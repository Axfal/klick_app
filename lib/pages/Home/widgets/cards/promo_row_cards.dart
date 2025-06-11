import 'package:klik_app/pages/Home/widgets/cards/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoRowCards extends StatelessWidget {
  const PromoRowCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeatureCard(
            title: "Online Shopping",
            subtitle: "Your convenience, Our mission",
            imagePath: "assets/images/online-shopping.png",

            // backgroundColor: const Color.fromARGB(255, 15, 110, 54),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: FeatureCard(
            title: "Beauty",
            subtitle: "MakeUp is your playground. Have fun!",
            imagePath: "assets/images/beauty.png",
            // backgroundColor: AppColors.lightGreenColor,
          ),
        ),
      ],
    );
  }
}
