import 'package:flutter/cupertino.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Dashboard/dashboard_page.dart';
import '../provider/auth_provider.dart';

/// OTP Screen for verifying user's email via 6-digit OTP
class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen(this.email, {super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPartnersText(),
                _buildSecureInfoBanner(),
                SizedBox(height: 60.h),
                _buildHeader(),
                SizedBox(height: 24.h),
                _buildOtpFields(),
                SizedBox(height: 24.h),
                _buildResendOption(authProvider),
                const Spacer(),
                _buildSignInButton(authProvider),
                SizedBox(height: 35.h),
              ],
            );
          },
        ),
      ),
    );
  }

  // -------------------------------
  // AppBar
  // -------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: AppColors.primaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OTP',
            style: TextStyle(fontSize: 22.sp, color: AppColors.whiteColor),
          ),
          SizedBox(width: 8.w),
          Container(height: 18.h, width: 1.w, color: AppColors.whiteColor),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            'assets/bottom_nav_icons/cart_white.svg',
            height: 20.h,
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  // -------------------------------
  // Partner Info Text
  // -------------------------------
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

  // -------------------------------
  // Secure Info Banner
  // -------------------------------
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

  // -------------------------------
  // OTP Header Section
  // -------------------------------
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "OTP Verification",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.h),
        Text(
          "Enter the OTP you received on",
          style: TextStyle(color: AppColors.greyColor, fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          widget.email,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  /// OTP Input Fields

  Widget _buildOtpFields() {
    return OtpTextField(
      numberOfFields: 6,
      cursorColor: AppColors.greyColor,
      focusedBorderColor: AppColors.secondaryColor,
      enabledBorderColor: AppColors.greyColor,
      fieldWidth: 45.sp,
      showFieldAsBox: true,
      textStyle: TextStyle(fontSize: 18.sp),
      borderRadius: BorderRadius.circular(10.r),
      onSubmit: (code) => setState(() => _otpCode = code),
    );
  }

  /// Resend OTP Option

  Widget _buildResendOption(AuthProvider authProvider) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Didn't receive code?",
            style: TextStyle(color: AppColors.greyColor, fontSize: 12.sp),
          ),
          GestureDetector(
            onTap: authProvider.isLoading
                ? null
                : () => authProvider.verifyOtp(
                    context,
                    email: widget.email,
                    otp: _otpCode,
                  ),
            child: Text(
              "Resend Code",
              style: TextStyle(
                color: AppColors.orangeColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Verify Button

  Widget _buildSignInButton(AuthProvider authProvider) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fixedSize: Size(220.w, 35.h),
      ),
      onPressed: authProvider.isLoading ? null : _verifyOtp(authProvider),
      child: authProvider.isLoading
          ? CupertinoActivityIndicator(color: AppColors.secondaryColor)
          : Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
    );
  }

  /// OTP Verification Logic

  VoidCallback _verifyOtp(AuthProvider authProvider) {
    return () async {
      if (_otpCode.isNotEmpty) {
        await authProvider.verifyOtp(
          context,
          email: widget.email,
          otp: _otpCode,
        );
      } else {
        _showSnackBar("Please enter OTP");
      }
    };
  }

  /// Reusable Snackbar

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
