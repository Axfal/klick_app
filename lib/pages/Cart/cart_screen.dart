//lib\pages\Cart\cart_screen.dart
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/pages/Cart/provider/cart_provider.dart';
import 'package:klik_app/pages/Checkout/checkout_screen.dart';
import 'package:klik_app/widgets/dummy_data.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }

  void _initializeData() async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    await cartProvider.getCart(context);
    // cartProvider.setImages(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(title: 'My Cart', showBackButton: false),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8FAFB), Color(0xFFE8F0F8)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: CartProductList(products: dummyProducts),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, provider),
    );
  }

  Widget _buildBottomNavigationBar(
    BuildContext context,
    CartProvider provider,
  ) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTotalPrice(provider),
            SizedBox(width: 12.w),
            Expanded(child: _buildCheckoutButton(context, provider)),
          ],
        ),
      ),
    );
  }

  /// Builds the total price display
  Widget _buildTotalPrice(CartProvider provider) {
    final total = provider.totalCartPrice;

    return Row(
      children: [
        Text(
          'Total:',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'PKR ${total.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// Builds the Checkout button
  Widget _buildCheckoutButton(BuildContext context, CartProvider provider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              // provider.cartModel?.cart?.isEmpty ?? true? Colors.grey:
              AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          elevation: 0,
        ),
        onPressed:
            // provider.cartModel?.cart?.isEmpty ?? true? null:
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutScreen()),
              );
            },
        child: Text(
          'Check Out',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
