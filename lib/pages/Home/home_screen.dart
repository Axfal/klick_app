// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:klik_app/constants/exports.dart';
import 'widgets/cards/promo_row_cards.dart';
import 'widgets/cards/bottom_feature_cards.dart';
import 'widgets/banner/banner_widget.dart';
import 'widgets/search_bar/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.microtask(() => getCategory());
  }

  void getCategory() async {
    final categoryProvider = Provider.of<CategoryProvider>(
      context,
      listen: false,
    );
    await categoryProvider.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.cardColor,
        toolbarHeight: 56.h,
        elevation: 4,
        title: const CustomSearchBar(),
        automaticallyImplyLeading: false,
      ),
      body: (categoryProvider.isLoading)
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _buildHeader(),
                      Positioned(
                        bottom: -25.h,
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
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        categoryWidget(),
                        SizedBox(height: 15),
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

  /// Categories (Instagram-style horizontal status list)
  Widget categoryWidget() {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categoryList = categoryProvider.categoryModel?.categories;

    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: categoryList?.length ?? 0,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final user = categoryList![index];
          final iconUrl = user.categoryIcon;

          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 28.r,
                    backgroundColor: Colors.grey.shade100,
                    child: ClipOval(
                      child: iconUrl == null || iconUrl.isEmpty
                          ? Icon(
                              Icons.broken_image,
                              size: 28.r,
                              color: Colors.grey,
                            )
                          : Image.network(
                              iconUrl,
                              fit: BoxFit.cover,
                              width: 56.r,
                              height: 56.r,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.broken_image,
                                    size: 16.r,
                                    color: Colors.grey,
                                  ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              SizedBox(
                width: 60.w,
                child: Text(
                  user.categoryName ?? '',
                  style: TextStyle(fontSize: 11.sp),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
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
