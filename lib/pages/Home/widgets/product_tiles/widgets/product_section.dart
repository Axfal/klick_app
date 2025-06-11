import 'package:klik_app/pages/Home/widgets/product_tiles/widgets/tile.dart';
import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  final List<Map<String, String>> items;
  final Color backgroundColor;

  const ProductSection({
    super.key,
    required this.items,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        return Tiles(
          title: item['title']!,
          imagePath: item['imagePath']!,
          backgroundColor: backgroundColor,
        );
      }).toList(),
    );
  }
}
