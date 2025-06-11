// ignore_for_file: depend_on_referenced_packages

import 'package:klik_app/pages/Home/widgets/brands/brand_widget.dart';
import 'package:klik_app/pages/Home/widgets/cards/beauty_card.dart';
import 'package:klik_app/pages/Home/widgets/cards/deals_card.dart';
import 'package:klik_app/pages/Home/widgets/cards/grid_row.dart';
import 'package:klik_app/pages/Home/widgets/cards/grocery_row.dart';
import 'package:klik_app/pages/Home/widgets/flash%20sales/flash_sale_widget.dart';
import 'package:klik_app/pages/Home/widgets/product_tiles/Product_tiles.dart';
import 'package:klik_app/pages/Home/widgets/slider/custome_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klik_app/constants/colors.dart';
import 'widgets/cards/promo_row_cards.dart';
import 'widgets/cards/bottom_feature_cards.dart';
import 'widgets/banner/banner_widget.dart';
import 'widgets/search_bar/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      // No appBar property here
      appBar: AppBar(
        backgroundColor: AppColors.cardColor,
        // const Color.fromARGB(255, 255, 150, 31),
        toolbarHeight: 56.h,
        elevation: 4,
        title: const CustomSearchBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildHeader(),
                Positioned(
                  bottom: -25.h, // Overlaps header by 25 height units
                  left: 12.w,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      '🔥 Limited time offer: Free shipping on orders over Rs.3500! 🔥',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h), // Add space to account for the overlap
            // Rest of the content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BannerWidget(),
                  SizedBox(height: 15),
                  PromoRowCards(),
                  SizedBox(height: 15),
                  CustomCarousel(),
                  SizedBox(height: 10),
                  BottomFeatureCards(),
                  SizedBox(height: 10),
                  GroceryRow(),
                  SizedBox(height: 10),
                  BeautyCard(),
                  SizedBox(height: 10),
                  GridRow(),
                  SizedBox(height: 10),
                  DealsCard(),
                  SizedBox(height: 10),
                  FlashSaleWidget(),
                  SizedBox(height: 10),
                  ProductTiles(),
                  SizedBox(height: 10),
                  BrandWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Rename _buildAppBar to _buildHeader since not used as appBar
  Widget _buildHeader() {
    return Container(
      height: 190.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF8A00), Color(0xFFFF6000)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const CustomSearchBar(),
            // SizedBox(height: 14.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text block
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HOT DEALS',
                        style: GoogleFonts.bangers(
                          color: Colors.yellow,
                          fontSize: 42.sp,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.black54,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Up to 70% off',
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Subscribe to get a special discount NOW!',
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Text(
                      //   'best deals for best pricing!',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 12.sp,
                      //     fontWeight: FontWeight.w400,
                      //     letterSpacing: 0.2,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    'assets/images/welcome_deal.png',
                    height: 160.h,
                    width: 160.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
