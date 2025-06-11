import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Super comfortable, 100% Cotton, Made in Pakistan");
    // Column(
    //   children: [
    //     _infoRow("Brand", "Example Brand"),
    //     _infoRow("Material", "100% Cotton"),
    //     _infoRow("Fit", "Regular Fit"),
    //     _infoRow("Country of Origin", "Pakistan"),
    //   ],
    // );
  }

  // Widget _infoRow(String title, String value) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 6.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
  //         ),
  //         Text(
  //           value,
  //           style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
