import 'package:klik_app/pages/FlashSale/flash_sale_screen.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = _getMustBuyProducts();

    return Column(
      children: [
        _buildSectionHeader(context),
        _buildHorizontalProductList(products, context),
      ],
    );
  }

  /// **Section Header with 'More' Button**
  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Flash Sale',
            style: GoogleFonts.bebasNeue(
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlashSaleScreen(),
                ),
              );
            },
            child: Text(
              'More',
              style: GoogleFonts.bebasNeue(
                fontSize: 16.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Optimized Horizontal Product ListView**
  Widget _buildHorizontalProductList(
    List<Map<String, dynamic>> products,
    BuildContext context,
  ) {
    return SizedBox(
      height: 225.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,

          childAspectRatio: 3 / 2.0,
          mainAxisSpacing: 6,
        ),
        itemCount: products.length,
        padding: EdgeInsets.symmetric(horizontal: 10.w), // Responsive padding
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            imageUrl: product['imageUrl'] ?? '',
            title: product['productName'] ?? 'No title',
            price: (product['price'] ?? 0).toDouble(),
            soldPerMonth: 'Sold ${product['soldCount'] ?? 0}/month',
            rating: (product['rating'] ?? 0).toDouble(),
            freeShipping: product['freeDelivery'] ?? false,
          );
        },
      ),
    );
  }

  /// **Must Buy Products List**
  List<Map<String, dynamic>> _getMustBuyProducts() {
    return [
      {
        'imageUrl': 'assets/images/product1.png',
        'productName': 'Home Gym \n Machine',
        'price': 1225,
        'discountedPercent': 20,
        'rating': 4.2,
        'ratingCount': 320,
        'soldCount': 150,
        'freeDelivery': true,
        'limitedTime': true,
      },
      {
        'imageUrl': 'assets/images/product2.png',
        'productName': 'Diamond Watch',
        'price': 1100,
        'discountedPercent': 18,
        'rating': 4.7,
        'ratingCount': 89,
        'soldCount': 200,
        'freeDelivery': true,
        'limitedTime': true,
      },
      {
        'imageUrl': 'assets/images/product3.png',
        'productName': 'Classic Watch',
        'price': 1199,
        'discountedPercent': 22,
        'rating': 4.5,
        'ratingCount': 270,
        'soldCount': 500,
        'freeDelivery': false,
        'limitedTime': true,
      },
      {
        'imageUrl': 'assets/images/product4.png',
        'productName': 'Nike Red Sneakers',
        'price': 999,
        'discountedPercent': 15,
        'rating': 4.6,
        'ratingCount': 412,
        'soldCount': 720,
        'freeDelivery': true,
        'limitedTime': true,
      },
      {
        'imageUrl': 'assets/images/product5.png',
        'productName': 'Floral Casual Shirt',
        'price': 799,
        'discountedPercent': 12,
        'rating': 3.9,
        'ratingCount': 102,
        'soldCount': 210,
        'freeDelivery': false,
        'limitedTime': true,
      },
    ];
  }
}
