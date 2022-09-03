import 'package:e_commerce_app/view/screens/cart_screen.dart';
import 'package:e_commerce_app/view/screens/home.dart';
import 'package:e_commerce_app/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';


class BottomNavBarProvider extends ChangeNotifier {
  int index = 0;

// ignore: prefer_final_fields
  List<Widget> widgets = [
    Home(),
    CartScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/Icon_Explore.png',fit: BoxFit.contain,),
        label: ''),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/Icon_Cart.png',fit: BoxFit.contain,),
        label: ''),
    BottomNavigationBarItem(
        icon:Image.asset('assets/images/Icon_User.png',fit: BoxFit.contain,),
        label: ''),
  ];

  changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
