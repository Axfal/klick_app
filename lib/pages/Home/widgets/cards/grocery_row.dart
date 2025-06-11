import 'package:klik_app/pages/Home/widgets/cards/widgets/cards.dart';
import 'package:flutter/material.dart';

class GroceryRow extends StatelessWidget {
  const GroceryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeatureCard(
            title: "Grocery Foods",
            subtitle: "Yahan Sab Milta Ha 😎. Munga k dekho",
            imagePath: "assets/images/food_grocery.png",
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: FeatureCard(
            title: "Grocery ",
            subtitle: "Daily Essentials. let's get going",
            imagePath: "assets/images/non_food_grocery.png",
          ),
        ),
      ],
    );
  }
}
