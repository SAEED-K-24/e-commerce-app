import 'dart:async';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/view/layout_screen.dart';
import 'package:e_commerce_app/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../helper/navigation_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((v) {
      NavigationHelper.navigationHelper
          .navigateToWidgetWithReplacement(SignInScreen());
    });
    return Scaffold(
      body: Container(
        child: SpinKitDoubleBounce(
          color: primaryColor,
          size: 80,
        ),
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Content.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
