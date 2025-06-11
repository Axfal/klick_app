import 'package:klik_app/pages/Home/widgets/cards/widgets/single_card.dart';
import 'package:flutter/material.dart';

class DealsCard extends StatelessWidget {
  const DealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleCard(
      title: "Promotional Deals",
      subtitle: "Stock up and save, it's the smart way to shop!😎",
      imagePath: "assets/images/welcome_deal.png",
    );
  }
}
