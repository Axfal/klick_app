import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingsWidget extends StatefulWidget {
  const RatingsWidget({super.key});

  @override
  State<RatingsWidget> createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingsWidget> {
  bool _showAll = false;

  final List<Map<String, dynamic>> _ratings = List.generate(10, (index) {
    return {
      'user': 'User ${index + 1}',
      'rating': 4.0 - (index % 3) * 0.5,
      'comment': 'Great product! Totally worth it.',
    };
  });

  // Estimate item height: roughly 80.h (adjust if needed)
  static const double _itemHeight = 80;

  @override
  Widget build(BuildContext context) {
    final ratingsToShow = _showAll ? _ratings : _ratings.take(2).toList();

    Widget ratingsList;

    if (_showAll) {
      // Scrollable ListView with fixed height to show 4 items at once
      ratingsList = SizedBox(
        height: _itemHeight * 4,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          itemCount: ratingsToShow.length,
          separatorBuilder: (_, __) =>
              Divider(color: Colors.grey.shade300, thickness: 1),
          itemBuilder: (context, index) {
            final rating = ratingsToShow[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: _buildRatingRow(rating),
            );
          },
        ),
      );
    } else {
      // Simple Column for initial 3 ratings
      ratingsList = Column(
        children: ratingsToShow.asMap().entries.map((entry) {
          int index = entry.key;
          var rating = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRatingRow(rating),
                if (index != ratingsToShow.length - 1)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Divider(color: Colors.grey.shade300, thickness: 1),
                  ),
              ],
            ),
          );
        }).toList(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recorded reviews are:  (${_ratings.length})",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            if (_ratings.length > 2)
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAll = !_showAll;
                  });
                },
                child: Text(_showAll ? "Show Less" : "Show All"),
              ),
          ],
        ),
        ratingsList,
      ],
    );
  }

  Widget _buildRatingRow(Map<String, dynamic> rating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              rating['user'],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Colors.grey[800],
              ),
            ),
            RatingBarIndicator(
              rating: rating['rating'],
              itemCount: 5,
              itemSize: 16.sp,
              direction: Axis.horizontal,
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          rating['comment'],
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey[700],
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
