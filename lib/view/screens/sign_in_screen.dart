import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/helper/navigation_helper.dart';
import 'package:e_commerce_app/view/layout_screen.dart';
import 'package:e_commerce_app/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/social_media_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80.h),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      offset: Offset(0.0, 0.0))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationHelper.navigationHelper
                              .navigateToWidget(const SignUpScren());
                        },
                        child: Text(
                          'Sign',
                          style:
                              TextStyle(fontSize: 18.sp, color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Sign in to Continue',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'example@mail.com',
                      //labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: '*********',
                      //labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    //padding: EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    //padding: EdgeInsets.all(16),
                    child: TextButton(
                      onPressed: () {
                        NavigationHelper.navigationHelper
                            .navigateToWidgetWithReplacement(
                                const LayoutScreen());
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              child: Text(
                '-OR-',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            SocialMediaButton(
                icon: Icons.facebook, label: 'Sign In with Facebook'),
            SizedBox(
              height: 20.sp,
            ),
            SocialMediaButton(
                icon: Icons.g_mobiledata, label: 'Sign In with Gmail'),
          ],
        ),
      ),
    );
  }
}
