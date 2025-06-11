import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';

class OrdersSlider extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const OrdersSlider({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    const tabWidth = 185.0; // Increase width for better UX

    return SizedBox(
      width: tabWidth * 2,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTab("Past Orders", 0, tabWidth),
              _buildTab("Current Orders", 1, tabWidth),
            ],
          ),

          // Sliding underline
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: selectedIndex * tabWidth,
            bottom: 0,
            child: Container(
              width: tabWidth,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, double width) {
    // final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: width,
        height: 48,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Bigger font
              color: AppColors.primaryColor,
              decoration: TextDecoration.none, // No underline here
            ),
          ),
        ),
      ),
    );
  }
}
