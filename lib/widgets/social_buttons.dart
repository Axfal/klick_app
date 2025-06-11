import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onToggleAuth;

  const SocialButtons({
    super.key,
    required this.isLogin,
    required this.onToggleAuth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text(
        //   "————————  Or  ————————",
        //   style: TextStyle(
        //     color: AppColors.primaryColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        const SizedBox(height: 15),
        _buildSocialButton(
          onPressed: () {},
          icon: const Icon(Icons.apple, color: Colors.black),
          label: const Text(
            "Login with Apple",
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 15),
        _buildSocialButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/google.png', height: 24),
          label: const Text(
            "Login with Google",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLogin ? "Don't have an account? " : "Already have an account? ",
              style: const TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              onTap: onToggleAuth,
              child: Text(
                isLogin ? "Sign up" : "Log in",
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildSocialButton({
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      icon: icon,
      label: label,
    );
  }
}
