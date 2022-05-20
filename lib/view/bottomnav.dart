import 'package:fitness/view/home.dart';
import 'package:fitness/view/shop.dart';
import 'package:fitness/view/workouts.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List pages = [
    const Home(),
    const Workouts(),
    const Profile(),
    const Shop(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  _handleTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      //----Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _handleTap,
        currentIndex: _selectedIndex,
        elevation: 30,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.teal,
        selectedFontSize: 14,
        iconSize: 29,
        unselectedFontSize: 13,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_gymnastics,
              ),
              label: 'Workouts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopify_rounded,
              ),
              label: 'Shop'),
        ],
      ),
    );
  }
}
