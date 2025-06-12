import 'package:klik_app/constants/exports.dart';

class ProfileScreen extends StatefulWidget {
  final bool isGuest;

  const ProfileScreen({super.key, this.isGuest = true});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showBanner = true;
  @override
  void initState() {
    super.initState();

    // Repeats every 3 seconds
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) return;
      setState(() {
        showBanner = !showBanner;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header without margin or padding
              _buildHeader(context),

              /// Body content with padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.isGuest) CustomCarousel(),
                    if (!widget.isGuest) ...[
                      /// My Orders
                      Card(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: _buildMyOrders(),
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                    SizedBox(height: 12.h),

                    /// Hot Sale
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8,
                      ),
                      child: Text(
                        "HOT SALE",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor.withOpacity(0.9),
                          shadows: [
                            Shadow(
                              offset: Offset(0.5, 0.5),
                              blurRadius: 1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (_, index) {
                        return ProductCard(
                          imageUrl: 'assets/images/product1.png',
                          title: 'Mi Box S Xiaomi Original',
                          price: 969,
                          soldPerMonth: '${320 + index * 10} sold/month',
                          rating: 4.5,
                          freeShipping: index.isEven,
                        );
                      },
                    ),

                    SizedBox(height: 24.h),

                    /// Services
                    Card(
                      color: Colors.white,
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: _buildServices(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.orangeColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          /// Only show Top Row if not guest
          if (!widget.isGuest)
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.whiteColor,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Hammad",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.yellowColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "VIP Center",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.settings, color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
          if (widget.isGuest)
            SizedBox(
              height: 60.h, // fixed height for the banner
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: showBanner
                    ? TweenAnimationBuilder<Offset>(
                        key: ValueKey(true),
                        tween: Tween(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        builder: (context, offset, child) {
                          return Transform.translate(
                            offset: Offset(
                              offset.dx * 300,
                              0,
                            ), // slide from right
                            child: child,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4.r,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.card_giftcard,
                                color: AppColors.orangeColor,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  'Subscribe now and get 10% off your first order!',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(
                        key: ValueKey(false),
                      ), // invisible but keeps space
              ),
            ),

          SizedBox(height: 8.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'PakZone',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Try your first order',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'with free shipping included',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 15.w,
                child: Image.asset(
                  'assets/images/welcome_deal.png',
                  height: 180.h,
                  width: 160.w,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),

          if (!widget.isGuest)
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatColumn(label: "Wishlist", value: "5"),
                  Container(height: 30.h, width: 1.w, color: Colors.white),
                  _StatColumn(label: "Coupons", value: "10"),
                  Container(height: 30.h, width: 1.w, color: Colors.white),
                  _StatColumn(label: "Points", value: "55"),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

Widget _buildMyOrders() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "My Orders",
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
      ),
      SizedBox(height: 12.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _OrderStatus(icon: Icons.image, label: "Pending"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _OrderStatus(icon: Icons.sync, label: "Processing"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _OrderStatus(icon: Icons.local_shipping, label: "Shipped"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _OrderStatus(icon: Icons.rate_review, label: "Review"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _OrderStatus(icon: Icons.timer, label: "Preorder"),
        ],
      ),
    ],
  );
}

Widget _buildServices() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Services",
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
      ),
      SizedBox(height: 12.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _ServiceIcon(icon: Icons.history, label: "Browsing \n History"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _ServiceIcon(icon: Icons.location_on, label: "Address"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _ServiceIcon(icon: Icons.support_agent, label: "Support"),
          Container(height: 50.h, width: 1.w, color: Colors.grey[300]),
          const _ServiceIcon(icon: Icons.info_outline, label: "About Us"),
        ],
      ),
    ],
  );
}
//}

class _OrderStatus extends StatelessWidget {
  final IconData icon;
  final String label;

  const _OrderStatus({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28.sp, color: AppColors.orangeColor),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.softGreenBG,
          child: Icon(icon, size: 20.sp, color: AppColors.orangeColor),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 10.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
