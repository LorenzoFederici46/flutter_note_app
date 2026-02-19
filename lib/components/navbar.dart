import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  // ignore: use_super_parameters
  const Navbar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade900,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          backgroundColor: Colors.blue.shade900,
          color: const Color.fromRGBO(255, 255, 255, 1),
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(icon: Icons.home_rounded, text: 'Home'),
            GButton(icon: Icons.receipt_long_rounded, text: 'Receipt'),
            GButton(icon: Icons.person_rounded, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
