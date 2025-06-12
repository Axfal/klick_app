import 'package:flutter/cupertino.dart';
import 'package:klik_app/constants/exports.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailAuthProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSecureInfoBanner(),
            _buildOfferSection(),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(
                      _emailController,
                      "Email",
                      false,
                      Icons.email,
                    ),
                    SizedBox(height: 15.h),
                    _buildTextField(
                      _passwordController,
                      "Password",
                      true,
                      Icons.lock,
                    ),
                    SizedBox(height: 20.h),
                    _buildLoginButton(emailAuthProvider),
                    SizedBox(height: 15.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLoginWithEmailOTP(),
                        SizedBox(height: 10.h),
                        SocialButtons(
                          isLogin: true,
                          onToggleAuth: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignupWithEmail(),
                              ),
                            );
                          },
                        ),
                        // _buildSignupText(),
                      ],
                    ),
                  ],
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
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
      //   onPressed: () => Navigator.pop(context),
      // ),
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primaryColor,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sign In',
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

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    bool obscureText,
    IconData icon,
  ) {
    return TextFormField(
      cursorColor: AppColors.greyColor,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
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
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter your $label' : null,
    );
  }

  Widget _buildLoginButton(AuthProvider emailAuthProvider) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      child: ElevatedButton(
        onPressed: _handleLogin(emailAuthProvider),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: emailAuthProvider.isLoading
            ? Center(
                child: CupertinoActivityIndicator(color: AppColors.whiteColor),
              )
            : Text(
                "Login",
                style: TextStyle(fontSize: 14.sp, color: AppColors.whiteColor),
              ),
      ),
    );
  }

  VoidCallback? _handleLogin(AuthProvider emailAuthProvider) {
    return () async {
      if (_formKey.currentState!.validate()) {
        await emailAuthProvider.loginUser(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      }
    };
  }

  // Widget _buildSignupText() {
  //   return GestureDetector(
  //     onTap: () => Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const SignupWithEmail()),
  //     ),
  //     child: Text(
  //       "Sign Up",
  //       style: TextStyle(
  //         color: AppColors.blackColor,
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLoginWithEmailOTP() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInWithEmailOTP()),
      ),
      child: Text(
        "Forgot password? Tap here with OTP",
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
