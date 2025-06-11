import 'package:klik_app/pages/Home/widgets/cards/widgets/grid_card.dart';
import 'package:flutter/material.dart';

class GridRow extends StatelessWidget {
  const GridRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: 1 Large Card
        Expanded(
          flex: 1,
          child: GridItemCard(
            title: "Electronics",
            subtitle: "Living made easy",
            imagePath: "assets/images/electronics.png",
            variant: GridCardVariant.large,
          ),
        ),
        SizedBox(width: 10),

        // Right: 2 stacked small cards
        Expanded(
          flex: 1,
          child: Column(
            children: const [
              GridItemCard(
                title: "Luggage",
                subtitle: "Explore the world ❤️",
                imagePath: "assets/images/luggage.png",
                variant: GridCardVariant.small,
              ),
              SizedBox(height: 10),
              GridItemCard(
                title: "Toys",
                subtitle: "Play. Laugh. Grow",
                imagePath: "assets/images/toys.png",
                variant: GridCardVariant.small,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
