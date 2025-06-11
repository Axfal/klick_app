import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: () {},
        child: const Text("Continue"),
      ),
    );
  }
}
