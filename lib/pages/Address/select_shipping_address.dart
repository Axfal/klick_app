import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/saved_address_widget.dart';
import 'add_shipping_address.dart';

class SelectShippingAddress extends StatefulWidget {
  const SelectShippingAddress({super.key});

  @override
  State<SelectShippingAddress> createState() => _SelectShippingAddressState();
}

class _SelectShippingAddressState extends State<SelectShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          child: Column(
            children: [
              _buildAddAddressButton(context),
              SizedBox(height: 8.h),
              _buildSavedAddresses(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.h),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Select Shipping Address',
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
    );
  }

  Widget _buildAddAddressButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
        border: Border.all(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddShippingAddress()),
          ),
          child: Text(
            '+ Address',
            style: TextStyle(fontSize: 16.sp, color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedAddresses() {
    return const Column(
      children: [
        SavedAddressWidget(
          userName: 'Abdul Rehman',
          phone: '03401607563',
          address: 'Wazirabad Road , Harrar , Sialkot',
          city: 'Punjab , Sialkot',
        ),
      ],
    );
  }
}
