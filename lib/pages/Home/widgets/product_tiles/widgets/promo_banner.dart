import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String imagePath;

  const PromoBanner({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
