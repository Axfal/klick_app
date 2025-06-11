import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/pages/Home/widgets/cards/widgets/single_card.dart';
import 'package:flutter/material.dart';

class BeautyCard extends StatelessWidget {
  const BeautyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleCard(
      title: "Beauty",
      subtitle: "Makeup is your playground. Have fun! 💄💕",
      imagePath: "assets/images/beauty.png",
      backgroundColor: AppColors.lightAmbaer,
      textColor: AppColors.blackColor,
    );
  }
}
