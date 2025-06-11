import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/pages/Auth/email%20section/signup_withEmail.dart';
import 'package:klik_app/pages/Auth/signIn_widget.dart';
import 'package:klik_app/pages/Home/widgets/slider/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupCard extends StatelessWidget {
  const LoginSignupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      backgroundColor: AppColors.lightAmbaer,
      child: Row(
        children: [
          Icon(Icons.person_outline, size: 26.sp, color: AppColors.iconColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "Log in or Sign up",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignInWidget()),
              );
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text("Login", style: TextStyle(fontSize: 13.sp)),
          ),
          SizedBox(width: 4.w),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignupWithEmail()),
              );
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text("Signup", style: TextStyle(fontSize: 13.sp)),
          ),
        ],
      ),
    );
  }
}
