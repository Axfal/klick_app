import 'package:klik_app/constants/colors.dart';
import 'package:klik_app/global_widgets/Custome_appBar.dart';
import 'package:klik_app/pages/Search/search.dart';
import 'package:klik_app/pages/subcategory/widgets/image_slider.dart';
import 'package:klik_app/pages/subcategory/widgets/promotiles.dart';
import 'package:klik_app/pages/Home/widgets/search_bar/search_bar.dart';
import 'package:klik_app/pages/Dashboard/provider/dashboard_provider.dart';
import 'package:klik_app/widgets/appBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceryFoodScreen extends StatelessWidget {
  const GroceryFoodScreen({super.key});

  void _onBottomNavTap(BuildContext context, int index) {
    // Update DashboardProvider to reflect the selected page
    final dashboardProvider = Provider.of<DashboardProvider>(
      context,
      listen: false,
    );
    dashboardProvider.updateSelectedIndex(index);

    // Navigate back to DashboardPage with new tab
    // Assuming DashboardPage is your main container holding all screens
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<DashboardProvider>().selectedIndex;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(
        title: "Grocery Food",
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchBar(),

            const ImageSlider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  PromoTile(
                    title: "Hot Sellers",
                    image: "assets/images/bread.png",
                  ),
                  PromoTile(
                    title: "Promotions",
                    image: "assets/images/bread.png",
                  ),
                  PromoTile(
                    title: "Price Match",
                    image: "assets/images/bread.png",
                  ),
                  PromoTile(
                    title: "FarmFields",
                    image: "assets/images/bread.png",
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select from various categories",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  PromoTile(
                    title: "Dry Fruits",
                    image: "assets/images/food_grocery.png",
                  ),
                  PromoTile(title: "Tea", image: "assets/images/milk.png"),
                  PromoTile(title: "Flour", image: "assets/images/milk.png"),
                  PromoTile(title: "Sugar", image: "assets/images/yogurt.png"),
                  PromoTile(
                    title: "Dry Fruits",
                    image: "assets/images/food_grocery.png",
                  ),
                  PromoTile(title: "Tea", image: "assets/images/milk.png"),
                  PromoTile(title: "Flour", image: "assets/images/milk.png"),
                  PromoTile(title: "Sugar", image: "assets/images/yogurt.png"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onBottomNavTap(context, index),
      ),
    );
  }
}
