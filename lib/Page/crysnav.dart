import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class CrysNavBar extends StatefulWidget {
  int selectab;
  void Function(int) indexchange;

  CrysNavBar({super.key,required this.selectab, required this.indexchange});
  @override
  
  State<CrysNavBar> createState() => _CrysNavBarState();

}

class _CrysNavBarState extends State<CrysNavBar> {
  
  @override
  Widget build(BuildContext context) {
    return CrystalNavigationBar(
      currentIndex: widget.selectab,
      height: 120,
      borderRadius: 25,
      unselectedItemColor: Colors.white70,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
      
      onTap: widget.indexchange,
      curve: Curves.linear,
      items:[
        CrystalNavigationBarItem(icon: IconlyBold.home,unselectedIcon: IconlyLight.home,selectedColor: const Color(0xFFffb17a)),
        CrystalNavigationBarItem(icon: IconlyBold.paper,unselectedIcon: IconlyLight.paper,selectedColor: const Color(0xFFffb17a)),
        CrystalNavigationBarItem(icon: IconlyBold.calendar,unselectedIcon: IconlyLight.calendar,selectedColor: const Color(0xFFffb17a)),
        CrystalNavigationBarItem(icon: IconlyBold.profile,unselectedIcon: IconlyLight.profile,selectedColor: const Color(0xFFffb17a)),
      ]

    );
  }
}