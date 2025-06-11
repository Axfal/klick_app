import 'package:klik_app/global_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h, // Increased height to fit full ProductCard
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: SizedBox(
            width: 140.w,
            child: ProductCard(
              imageUrl: 'assets/images/product2.png',
              title: 'Product ${index + 1}',
              price: 2000 + (index * 500),
              soldPerMonth: '${30 + index * 10} sold/month',
              rating: 4.5,
              freeShipping: index % 2 == 0,
            ),
          ),
        ),
      ),
    );
  }
}
