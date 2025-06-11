import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/pages/Address/select_shipping_address.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/check_out_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [_buildAddressSection(context), _buildCartItems()],
        ),
      ),
    );
  }

  /// Builds the Address Selection Section.
  Widget _buildAddressSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        color: AppColors.whiteColor,
        width: double.infinity,
        height: 60.h,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () => _navigateToSelectShippingAddress(context),
          child: Text(
            '+ Address',
            style: TextStyle(fontSize: 14.sp, color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }

  /// Navigates to the Select Shipping Address screen.
  void _navigateToSelectShippingAddress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectShippingAddress()),
    );
  }

  /// Builds the Cart Items Section.
  Widget _buildCartItems() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Container(
        color: AppColors.whiteColor,
        width: double.infinity,
        child: const CheckOutCard(
          shippedBy: 'Shipped by Global Sellers',
          productName: 'Original Branded T-Shirt',
          brand: 'No Brand',
          colorFamily: 'Black',
          rupees: 1000.00,
          quantityProduct: 1,
          deliveryCharges: 120,
        ),
      ),
    );
  }
}
