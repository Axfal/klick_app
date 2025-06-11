import 'package:flutter/material.dart';

class PromoTile extends StatelessWidget {
  final String title;
  final String image;
  const PromoTile({super.key, required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Container(
          width: double.infinity, // full width of parent
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Image.asset(
                image,
                height: 55,
              ), // Reduced height for a horizontal layout
            ],
          ),
        ),
      ),
    );
  }
}
