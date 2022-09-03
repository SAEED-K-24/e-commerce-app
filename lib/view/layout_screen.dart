import 'package:e_commerce_app/provider/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (BuildContext context, BottomNavBarProvider p, Widget? child) =>
          Scaffold(
        body: p.widgets[p.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: p.index,
          onTap: (i) {
            p.changeIndex(i);
          },
          items: p.items,
        ),
      ),
    );
  }
}
