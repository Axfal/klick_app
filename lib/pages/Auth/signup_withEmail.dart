// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:klik_app/constants/exports.dart';

class SignupWithEmail extends StatefulWidget {
  const SignupWithEmail({super.key});

  @override
  SignupWithEmailState createState() => SignupWithEmailState();
}

class SignupWithEmailState extends State<SignupWithEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  String countryCode = '+92';
  bool isPhoneValid = true;

  @override
  Widget build(BuildContext context) {
    print('Building..');
    final emailAuthProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildSecureInfoBanner(),
            _buildOfferSection(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        _nameController,
                        'Full Name',
                        Icons.person,
                      ),
                      _buildTextField(
                        _emailController,
                        'Email Address',
                        Icons.email,
                        isEmail: true,
                      ),
                      _buildPhoneField(),
                      _buildTextField(
                        _passwordController,
                        'Password',
                        Icons.lock,
                        isPassword: true,
                      ),
                      _buildTextField(
                        _confirmPasswordController,
                        'Confirm Password',
                        Icons.lock,
                        isPassword: true,
                      ),
                      _buildTextField(
                        _referralController,
                        'Referral Code (Optional)',
                        Icons.card_giftcard,
                      ),
                      SizedBox(height: 16.h),
                      _buildSignupButton(context, emailAuthProvider),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
            'Sign Up',
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
        ],
      ),
      centerTitle: true,
    );
  }

  Widget _buildSecureInfoBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
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

  Widget _buildOfferItem(IconData icon, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14.sp, color: AppColors.primaryColor),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(subtitle, style: TextStyle(fontSize: 10.sp)),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: IntlPhoneField(
        cursorColor: AppColors.greyColor,
        controller: _phoneController,
        initialCountryCode: 'PK',
        decoration: InputDecoration(
          labelText: 'Phone Number',
          labelStyle: const TextStyle(color: AppColors.greyColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: isPhoneValid
                  ? AppColors.greyColor
                  : AppColors.secondaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: isPhoneValid
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              width: 1.0,
            ),
          ),
        ),
        onChanged: (phone) {
          setState(() {
            countryCode = phone.countryCode;
            isPhoneValid = phone.number.isNotEmpty;
          });
        },
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool isPassword = false,
    bool isEmail = false,
  }) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: TextFormField(
            cursorColor: AppColors.greyColor,
            controller: controller,
            keyboardType: isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
            obscureText: isPassword
                ? (controller == _passwordController
                      ? !provider.isPasswordVisible
                      : !provider.isConfirmPasswordVisible)
                : false,
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: const TextStyle(color: AppColors.greyColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.greyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: AppColors.secondaryColor,
                  width: 1.0,
                ),
              ),
              prefixIcon: Icon(icon, color: AppColors.greyColor),
              suffixIcon: isPassword
                  ? IconButton(
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        controller == _passwordController
                            ? (provider.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)
                            : (provider.isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                        color:
                            (controller == _passwordController
                                ? provider.isPasswordVisible
                                : provider.isConfirmPasswordVisible)
                            ? AppColors.lightOrangeColor
                            : AppColors.secondaryColor,
                      ),
                      onPressed: () {
                        if (controller == _passwordController) {
                          provider.togglePasswordVisibility();
                        } else {
                          provider.toggleConfirmPasswordVisibility();
                        }
                      },
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSignupButton(BuildContext context, AuthProvider provider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: provider.isLoading
            ? null
            : () async {
                if (!_formKey.currentState!.validate()) {
                  ToastHelper.showError('Please fill all fields correctly');
                  return;
                }

                if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  ToastHelper.showError('Passwords do not match');
                  return;
                }

                await provider.signUpUser(
                  context,
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  phone: "$countryCode${_phoneController.text.trim()}",
                  countryCode: countryCode,
                  password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,
                  deviceId: '',
                  referralCode: _referralController.text.trim(),
                );
              },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.whiteColor,
          backgroundColor: provider.isLoading
              ? AppColors.greyColor
              : AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ),
        child: provider.isLoading
            ? CupertinoActivityIndicator(color: AppColors.secondaryColor)
            : Text(
                'Sign Up',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
