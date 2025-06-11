import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String buyNowButton;
  final String productImage;
  final bool isProductImageVisible;
  final bool isProductDescriptionVisible;
  final double productNameFontSize;
  final double productDescriptionFontSize;
  final double productPriceFontSize;
  final FontWeight productNameFontWeight;
  final FontWeight productDescriptionFontWeight;
  final FontWeight productPriceFontWeight;
  final Color productNameColor;
  final Color productDescriptionColor;

  const BannerCard({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.buyNowButton,
    required this.productImage,
    this.isProductImageVisible = true,
    this.isProductDescriptionVisible = true,
    this.productNameFontSize = 15.0,
    this.productDescriptionFontSize = 13.0,
    this.productPriceFontSize = 12.0,
    this.productNameFontWeight = FontWeight.bold,
    this.productDescriptionFontWeight = FontWeight.normal,
    this.productPriceFontWeight = FontWeight.bold,
    this.productNameColor = Colors.black,
    this.productDescriptionColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: MediaQuery.of(context).size.width * 0.10,
      decoration: BoxDecoration(
        color: AppColors.lightAmbaer,
        borderRadius: BorderRadius.circular(10.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.15),
        //     blurRadius: 8,
        //     offset: const Offset(0, 10),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 🏷 **Left Side - Text Content (Expanded to prevent overflow)**
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isProductImageVisible) _buildLogo(),
                _buildProductNameText(),
                if (isProductDescriptionVisible) _buildDescriptionText(),
                _buildProductPriceText(),
                _buildBuyNowButton(),
              ],
            ),
          ),

          /// 🖼 **Right Side - Image (With Fixed Size)**
          if (productImage.isNotEmpty)
            SizedBox(
              width: 90.w,
              height: 100.h,
              child: Image.asset(productImage, fit: BoxFit.contain),
            ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          // Image.asset(
          //   'assets/images/klik_logo.png',
          //   width: 20.w,
          //   height: 20.h,
          //   fit: BoxFit.contain,
          // ),
          SizedBox(width: 4.w),
          Text(
            'NEW Discount Alailable!',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.redColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// 🏷 **Product Name (Limited to 1 Line)**
  Widget _buildProductNameText() {
    return Text(
      productName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: productNameFontSize.sp,
        fontWeight: productNameFontWeight,
        color: productNameColor,
      ),
    );
  }

  /// 💰 **Product Price (Separate)**
  Widget _buildProductPriceText() {
    return Text(
      "Rs. $productPrice",
      style: TextStyle(
        fontSize: productPriceFontSize.sp,
        fontWeight: productPriceFontWeight,
        color: AppColors.blackColor,
      ),
    );
  }

  /// 📜 **Description (Limited to 2 Lines)**
  Widget _buildDescriptionText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        productDescription,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: productDescriptionFontSize.sp,
          fontWeight: productDescriptionFontWeight,
          color: productDescriptionColor,
        ),
      ),
    );
  }

  Widget _buildBuyNowButton() {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Text(
        buyNowButton,
        style: TextStyle(fontSize: 10.sp, color: AppColors.whiteColor),
      ),
    );
  }
}
