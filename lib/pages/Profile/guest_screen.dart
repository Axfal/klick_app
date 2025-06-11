import 'package:flutter/material.dart';
import 'profile_screen.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(isGuest: true);
  }
}
