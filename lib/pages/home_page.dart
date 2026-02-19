import 'package:flutter/material.dart';
import 'package:note_app/pages/home.dart';
import 'package:note_app/components/navbar.dart';
import 'package:note_app/pages/profile.dart';
import 'package:note_app/pages/receipt.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Home(), Receipt(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.restaurant_menu_rounded, color: Colors.white),
        title: const Text('Benvenuti', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade900,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade400, Colors.orange.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),

      bottomNavigationBar: Navbar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
