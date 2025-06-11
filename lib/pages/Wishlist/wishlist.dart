import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/global_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klik_app/pages/Search/search.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(
        title: "My Wishlist",
        showBackButton: false,

        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.whiteColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _wishlistItem(
              imageUrl: 'assets/images/product1.png', // replace with actual
              title: 'CASIO GL LTP-V004D-1B2UDF',
              price: 'Rs. 11,300.00',
            ),
            const SizedBox(height: 12),
            _wishlistItem(
              imageUrl: 'assets/images/product1.png',
              title: 'CASIO GL VT01L-2BUDF',
              price: 'Rs. 12,900.00',
            ),
            const SizedBox(height: 20),
            _promotionalWishlistCard(context),
          ],
        ),
      ),
    );
  }

  Widget _wishlistItem({
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 60, height: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.teal)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orangeColor,
              foregroundColor: AppColors.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // TODO: Navigate to shopping page
            },
            child: const Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 16,
                // , fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _promotionalWishlistCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Behold the Magic Wishlist Machine!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (_, index) {
              return ProductCard(
                imageUrl: 'assets/images/product1.png',
                title: 'Mi Box S Xiaomi Original',
                price: 969,
                soldPerMonth: '${320 + index * 10} sold/month',
                rating: 4.5,
                freeShipping: index.isEven,
              );
            },
          ),
        ],
      ),
    );
  }
}
