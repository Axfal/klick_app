import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final String image;
  const CategoryTile({super.key, required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 60),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
