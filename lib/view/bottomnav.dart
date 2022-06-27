import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/home.dart';
import 'package:fitness/view/shop.dart';
import 'package:fitness/view/workouts.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';

class BottomNav extends StatefulWidget {
  final int index;
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;
  const BottomNav(
      {Key? key, required this.index, this.analytics, this.observer})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List<Widget>? pages;

  FirebaseAnalytics? analytics;

  @override
  void initState() {
    _selectedIndex = widget.index;
    analytics = widget.analytics;
    pages = [
      const Home(),
      // Example(),
      const Workouts(),
      const Shop(),
      Profile(
        analytics: AnalyticsService.analytics,
        observer: AnalyticsService.observer,
      ),
    ];
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
      body: pages![_selectedIndex],
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
                Icons.shopify_rounded,
              ),
              label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
