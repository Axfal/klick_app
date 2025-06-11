import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/global_widgets/product_card.dart';
import 'package:klik_app/pages/Dashboard/provider/dashboard_provider.dart';
import 'package:klik_app/pages/Home/widgets/search_bar/search_bar.dart';
import 'package:klik_app/widgets/appBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FlashSaleScreen extends StatelessWidget {
  const FlashSaleScreen({super.key});

  void _onBottomNavTap(BuildContext context, int index) {
    // Update DashboardProvider to reflect the selected page
    final dashboardProvider = Provider.of<DashboardProvider>(
      context,
      listen: false,
    );
    dashboardProvider.updateSelectedIndex(index);

    // Navigate back to DashboardPage with new tab
    // Assuming DashboardPage is your main container holding all screens
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<DashboardProvider>().selectedIndex;
    List<Map<String, dynamic>> products = _getFlashSaleProduct();

    return Scaffold(
      backgroundColor: AppColors.softGreenBG,
      appBar: const CustomAppBar(title: 'Flash Sale'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: CustomSearchBar(),
            ),
            Divider(
              height: 20, // Space around the divider
              thickness: 2, // Line thickness
              color: AppColors.primaryColor, // Line color
              // indent: 16, // Padding from left
              // endIndent: 16, // Padding from right
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: _buildProductGrid(products),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onBottomNavTap(context, index),
      ),
    );
  }

  /// Function to create product grid
  Widget _buildProductGrid(List<Map<String, dynamic>> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.4 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductCard(
          imageUrl: product['imageUrl'] ?? '', // fallback to empty string
          title: product['productName'] ?? 'No title',
          price: (product['price'] ?? 0).toDouble(),
          soldPerMonth: 'Sold ${product['soldCount'] ?? 0}/month',
          rating: (product['rating'] ?? 0).toDouble(),
          freeShipping: product['freeDelivery'] ?? false,
        );
      },
    );
  }

  /// Function to return Flash Sale Products List
  List<Map<String, dynamic>> _getFlashSaleProduct() {
    return [
      {
        'imageUrl': 'assets/images/product3.png',
        'productName': 'Branded 5 in 1',
        'price': 150.0,
        'soldCount': 10,
        'rating': 4.5,
        'freeDelivery': true,
      },
      {
        'imageUrl': 'assets/images/product1.png',
        'productName': 'Hair Serum',
        'price': 120.0,
        'soldCount': 25,
        'rating': 4.2,
        'freeDelivery': false,
      },
      {
        'imageUrl': 'assets/images/milk.png',
        'productName': 'Goat Milk Lotion',
        'price': 300.0,
        'soldCount': 5,
        'rating': 4.8,
        'freeDelivery': true,
      },
      {
        'imageUrl': 'assets/images/img.png',
        'productName': 'Vitamin C Serum',
        'price': 199.0,
        'soldCount': 40,
        'rating': 4.4,
        'freeDelivery': true,
      },
      {
        'imageUrl': 'assets/images/product3.png',
        'productName': 'Night Cream',
        'price': 220.0,
        'soldCount': 18,
        'rating': 4.6,
        'freeDelivery': false,
      },
    ];
  }
}
