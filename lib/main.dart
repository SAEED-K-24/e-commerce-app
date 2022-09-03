import 'package:e_commerce_app/provider/bottom_nav_bar_provider.dart';
import 'package:e_commerce_app/provider/carts_provider.dart';
import 'package:e_commerce_app/provider/products_provider.dart';
import 'package:e_commerce_app/provider/users_provider.dart';
import 'package:e_commerce_app/view/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'helper/navigation_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your .
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavBarProvider>(
            create: (ctx) => BottomNavBarProvider()),
        ChangeNotifierProvider<ProductsProvider>(
            create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider<CartsProvider>(
            create: (ctx) => CartsProvider()),
        ChangeNotifierProvider<UsersProvider>(create: ((context) => UsersProvider())),
        //   ChangeNotifierProvider<AuthProvider>(create: (ctx) => AuthProvider()),
      ],
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: NavigationHelper.navigationHelper.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
