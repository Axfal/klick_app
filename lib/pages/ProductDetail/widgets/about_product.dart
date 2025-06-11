import 'package:klik_app/pages/ProductDetail/widgets/action_buttons.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutProduct extends StatelessWidget {
  final Product product;

  const AboutProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final int finalPrice = product.discountedPercent != null
        ? (product.price - (product.price * product.discountedPercent! / 100))
              .toInt()
        : product.price;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// DELIVERY BADGE
        if (product.deliveryTime != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                product.deliveryTime!,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orangeColor,
                ),
              ),
            ),
          ),

        SizedBox(height: 5.h),

        /// TITLE + HEART ICON
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product.productName.toUpperCase(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(Icons.favorite_border, color: Colors.red, size: 22.sp),
          ],
        ),

        SizedBox(height: 3.h),

        /// SKU
        if (product.sku != null)
          Text(
            "SKU: ${product.sku}",
            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500),
          ),

        SizedBox(height: 4.h),

        /// PRICE
        Text(
          "Rs. ${finalPrice.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        /// Quantity and Add to Cart
        const ProductActionButtons(),
      ],
    );
  }
}
