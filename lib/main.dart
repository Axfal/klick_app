import 'package:klik_app/pages/Auth/email%20section/provider/email_authProvider.dart';
import 'package:klik_app/pages/Cart/provider/cart_provider.dart';
import 'package:klik_app/pages/Category/provider/category_provider.dart';
import 'package:klik_app/pages/Dashboard/dashboard_page.dart';
import 'package:klik_app/pages/Dashboard/provider/dashboard_provider.dart';
import 'package:klik_app/pages/Home/widgets/banner/provider/banner_provider.dart';
import 'package:klik_app/pages/Home/widgets/brands/provider/home_brand_provider.dart';
import 'package:klik_app/pages/Home/widgets/search_bar/provider/search_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => SearchBarProvider()),
        ChangeNotifierProvider(create: (_) => EmailAuthProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => HomeBrandProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DashboardPage(),
          );
        },
      ),
    );
  }
}
