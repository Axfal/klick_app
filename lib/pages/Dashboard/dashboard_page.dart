import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/pages/Cart/cart_screen.dart';
import 'package:klik_app/pages/Category/category_screen.dart';
import 'package:klik_app/pages/Home/home_screen.dart';
import 'package:klik_app/pages/Profile/guest_screen.dart';
import 'package:klik_app/pages/Wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klik_app/pages/Orders/order_screen.dart';
import 'provider/dashboard_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final List<Widget> _pages = [
    const HomeScreen(),
    CategoryScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const GuestScreen(), // Profile for guest
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, _) {
        final selectedIndex = dashboardProvider.selectedIndex;

        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: IndexedStack(index: selectedIndex, children: _pages),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => dashboardProvider.updateSelectedIndex(index),
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: "Orders",
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
                          "4", // Can be dynamic
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
                icon: Icon(Icons.favorite_border),
                label: "Wishlist",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
