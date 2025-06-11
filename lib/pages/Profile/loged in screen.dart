import 'package:flutter/material.dart';
import 'profile_screen.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(isGuest: false);
  }
}
