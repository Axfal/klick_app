//lib\pages\Category\category_screen.dart
import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/pages/Category/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:klik_app/pages/subcategory/grocery_food.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryProvider>().categories;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(
        title: 'Categories',
          showBackButton: false,

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.73,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroceryFoodScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 65.w,
                    height: 65.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3F3F3),
                    ),
                    child: ClipOval(
                      child: Image.asset(item.image, fit: BoxFit.cover),
                    ),
                  ),
                ),

                SizedBox(height: 6.h),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
