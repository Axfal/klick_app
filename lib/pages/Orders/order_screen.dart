import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/pages/Orders/widgets/slider.dart'; // Custom slider widget
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(title: 'My orders', showBackButton: false),
      body: Column(
        children: [
          OrdersSlider(
            selectedIndex: selectedIndex,
            onTabSelected: (index) => setState(() => selectedIndex = index),
          ), // Your custom slider widget
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/empty-cart.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orangeColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Looks like you haven\'t added anything to your cart yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeColor,
                      foregroundColor: AppColors.whiteColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Navigate to shopping page
                    },
                    child: const Text(
                      'Start Shopping',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
  }
}
