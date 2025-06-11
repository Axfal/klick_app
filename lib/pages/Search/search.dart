import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';

class SearchScreen extends StatelessWidget {
  final List<String> recentSearches = ['shoe', 'shoes', 'Chicken Meat'];
  final List<String> topSearches = [
    'Olpers',
    'Chicken Meat',
    'Humidifier',
    'Creed Perfumes',
    'Olpers',
    'Calvin Klein',
    'Gucci',
    'Dairy Milk',
    'Atta',
  ];

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(
        title: 'Search',
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                size: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: AppColors.greyColor),
                  hintText: 'What are you looking for?',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.close, color: AppColors.greyColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: recentSearches
                  .map(
                    (search) => Chip(
                      shape: StadiumBorder(
                        side: BorderSide(color: AppColors.orangeColor),
                      ),
                      backgroundColor: AppColors.scaffoldColor,
                      label: Text(search),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () {},
                      deleteIconColor: AppColors.lightGreyColor,
                      labelStyle: const TextStyle(color: AppColors.blackColor),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 25),
            const Text(
              'Top Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: topSearches
                  .map(
                    (search) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.orangeColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        search,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
