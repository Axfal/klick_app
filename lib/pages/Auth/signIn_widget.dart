import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/pages/Auth/signup_withEmail.dart';
import 'package:klik_app/pages/Dashboard/dashboard_page.dart';
import 'package:klik_app/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'signIn_withEmail.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildPartnersText(),
          _buildSecureInfoBanner(),
          _buildOfferSection(),
          SizedBox(height: 30.h),
          Expanded(child: _buildLoginOptions(context)),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.h),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'PakZon',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(width: 8.w),
            Container(height: 18.h, width: 1.0.w, color: AppColors.whiteColor),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              'assets/bottom_nav_icons/cart_white.svg',
              height: 20.h,
            ),
            // Image.asset('assets/images/app_logo.webp', height: 33.h),
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _buildPartnersText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        'Official E-commerce Services Partner',
        style: TextStyle(color: AppColors.greyColor, fontSize: 12.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// **Secure Info Banner**
  Widget _buildSecureInfoBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        color: AppColors.lightOrangeColor,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.gpp_good, size: 18.sp, color: AppColors.orangeColor),
            SizedBox(width: 8.w),
            Text(
              'Your information is protected',
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }

  /// **Offer Section**
  Widget _buildOfferSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Container(
        width: 330.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.primaryColor.withOpacity(0.10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOfferItem(Icons.percent, 'Welcome Deal', 'Upto 70% off'),
              Container(width: 3.w, color: AppColors.whiteColor),
              _buildOfferItem(
                Icons.local_shipping_outlined,
                'Buyer Protection',
                'Easy returns & refunds',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Offer Item**
  Widget _buildOfferItem(IconData icon, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 14.sp, color: AppColors.primaryColor),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 10.sp, color: AppColors.blackColor),
        ),
      ],
    );
  }

  Widget _buildLoginOptions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLoginButton(Icons.email, 'Email', AppColors.primaryColor, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInWithEmail()),
            );
          }),
          _buildOrDivider(),
          SocialButtons(
            isLogin: true,
            onToggleAuth: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignupWithEmail()),
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
            child: Text(
              'Continue as Guest',
              style: TextStyle(
                color: AppColors.blackColor,
                decoration: TextDecoration.underline,
                fontSize: 14.sp,
              ),
            ),
          ),
          const Spacer(),
          _buildTermsText(),
        ],
      ),
    );
  }

  Widget _buildLoginButton(
    IconData icon,
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      // width: 220.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20.sp),
            SizedBox(width: 10.w),
            Text(
              text,
              style: TextStyle(fontSize: 14.sp, color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        children: [
          const Expanded(child: Divider(color: AppColors.greyColor)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text('Or', style: TextStyle(fontSize: 12.sp)),
          ),
          const Expanded(child: Divider(color: AppColors.greyColor)),
        ],
      ),
    );
  }

  Widget _buildTermsText() {
    return Center(
      child: Text(
        'By registering for a PakZon account, you agree that you have read and accepted our PakZon Free Membership Agreement and Privacy Policy.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12.sp, color: AppColors.greyColor),
      ),
    );
  }
}
