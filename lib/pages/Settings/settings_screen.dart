import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text("Settings", style: TextStyle(color: AppColors.blackColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.blackColor),
      ),
      body: ListView(
        children: [
          _buildTile("Account Settings", onTap: () {}),
          _buildTile("Address Book", onTap: () {}),
          _buildTile("Country", trailingText: "Egypt"),
          _buildTile("Currency", trailingText: "EGP"),
          _buildTile("Language", trailingText: "English"),
          Divider(height: 32.h, thickness: 1, color: AppColors.lightGreyColor),
          _buildTile("Notification Settings", onTap: () {}),
          _buildTile("Privacy Policy", onTap: () {}),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size.fromHeight(48.h),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(String title, {VoidCallback? onTap, String? trailingText}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
      trailing: trailingText != null
          ? Text(trailingText, style: TextStyle(fontSize: 12.sp))
          : Icon(Icons.arrow_forward_ios, size: 14.sp),
      onTap: onTap,
    );
  }
}
