// widgets/app_bottom_nav_bar.dart
import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.shopping_cart),
              Positioned(
                right: -6,
                top: -4,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.orange,
                  child: Text(
                    "4", // You can make this dynamic with a CartProvider if needed
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: "Cart",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Wishlist",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
