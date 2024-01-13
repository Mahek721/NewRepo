import 'package:elite_ecommerce/constants/custom_colors.dart';
import 'package:elite_ecommerce/screens/cart_page.dart';
import 'package:elite_ecommerce/screens/categiories_page.dart';
import 'package:elite_ecommerce/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List Pages = [
    Center(child: Text("Home Page"),),
    CategoriesScreen(),
    Center(child: Text("Wishlist"),),
    CartScreen(),
    ProfileScreen(),
  ];
  
  int currentIndex = 0;
  void onTabChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentIndex],
      bottomNavigationBar: _customeBottomNavigationBar(),
    );
  }

  _customeBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: n17,
          borderRadius: BorderRadius.circular(15),
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: Colors.grey,
            activeColor: s80,
            gap: 8,
            padding: const EdgeInsets.all(10),
            onTabChange: onTabChange,
            tabs: [
              GButton(
                icon: currentIndex == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house,
              ),
              GButton(
                icon: currentIndex == 1 ? Icons.dashboard_rounded : Icons.dashboard_outlined,
              ),
              GButton(
                icon: currentIndex == 2 ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              ),
              GButton(
                icon: currentIndex == 3 ? Icons.shopping_bag : Icons.shopping_bag_outlined,
              ),
              GButton(
                icon: currentIndex == 4 ? CupertinoIcons.person_solid : CupertinoIcons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }
}