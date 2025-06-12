import 'dart:async';
import 'package:klik_app/pages/Home/widgets/slider/widgets/delivery_time_card.dart';
import 'package:klik_app/pages/Home/widgets/slider/widgets/logout_login_singup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final PageController _controller = PageController(viewportFraction: 1.0);
  int _currentPage = 0;
  late Timer _timer;

  final List<Widget> cards = [const DeliveryInfoCard(), LogoutLoginSignupCard()];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % cards.length;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: cards.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                child: cards[index],
              );
            },
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
