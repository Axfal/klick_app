import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klik_app/pages/Home/widgets/product_tiles/widgets/product_section.dart';
import 'package:klik_app/pages/Home/widgets/product_tiles/widgets/promo_banner.dart';
// import 'package:ecomerce_app/pages/Home/widgets/product_tiles/widgets/promo_banner.dart';
import 'package:klik_app/pages/Home/widgets/product_tiles/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:klik_app/constants/colors.dart';

class ProductTiles extends StatelessWidget {
  const ProductTiles({super.key});

  Widget buildBox({required Widget child}) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SectionHeader(
                title: 'Get Your Daily Essentials Delivered',
                subtitle: 'Straight to Your Door-All with the Klick App!',
              ),
              SizedBox(height: 12),
              ProductSection(
                backgroundColor: AppColors.orangeColor,
                items: [
                  {'title': 'Yogurt', 'imagePath': 'assets/images/yogurt.png'},
                  {'title': 'Milk', 'imagePath': 'assets/images/milk.png'},
                  {'title': 'Bread', 'imagePath': 'assets/images/bread.png'},
                ],
              ),
            ],
          ),
        ),
        buildBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SectionHeader(
                title: 'Exploring Boundless Horizons!',
                subtitle: 'Travels in style, track your time, and stay fit!',
              ),
              SizedBox(height: 12),
              ProductSection(
                backgroundColor: AppColors.orangeColor,
                items: [
                  {
                    'title': 'Luggage',
                    'imagePath': 'assets/images/luggage.png',
                  },
                  {'title': 'Watches', 'imagePath': 'assets/images/watch.png'},
                  {
                    'title': 'Fitness',
                    'imagePath': 'assets/images/product1.png',
                  },
                ],
              ),
            ],
          ),
        ),
        buildBox(
          child: const PromoBanner(imagePath: 'assets/images/store1.jpg'),
        ),
      ],
    );
  }
}
