import 'package:carousel_slider/carousel_slider.dart';
import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarousel({super.key, required this.imageUrls});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;
  // final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Carousel
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          // carouselController: _carouselController,
          options: CarouselOptions(
            height: 300.h,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 12 / 9,
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, _) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  widget.imageUrls[index],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            );
          },
        ),

        SizedBox(height: 5.h),

        // Image Gallery Thumbnails
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // padding: EdgeInsets.symmetric(horizontal: 12.w),
            itemCount: widget.imageUrls.length,
            separatorBuilder: (_, __) => SizedBox(width: 5.w),
            itemBuilder: (context, index) {
              final isSelected = index == _currentIndex;
              return GestureDetector(
                onTap: () {
                  // _carouselController.animateToPage(index);
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      widget.imageUrls[index],
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
