import 'package:e_commerce_app/helper/navigation_helper.dart';
import 'package:e_commerce_app/provider/users_provider.dart';
import 'package:e_commerce_app/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Consumer<UsersProvider>(builder: ((context, value, child) {
        return FutureBuilder(
            future: value.getOneUser(),
            builder: (context, snapshot) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.w,
                            height: 120.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/person.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${value.user!.username}',
                                style: TextStyle(
                                  fontSize: 26.sp,
                                ),
                              ),
                              Text(
                                '${value.user!.email}',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      _buildAccountWidget('Icon_Edit.png', 'Edit Profile'),
                      SizedBox(
                        height: 20.h,
                      ),
                      _buildAccountWidget(
                          'Icon_Location.png', 'Shipping Address'),
                      SizedBox(
                        height: 20.h,
                      ),
                      _buildAccountWidget('Icon_History.png', 'Order History'),
                      SizedBox(
                        height: 20.h,
                      ),
                      _buildAccountWidget('Icon_Payment.png', 'Cards'),
                      SizedBox(
                        height: 20.h,
                      ),
                      _buildAccountWidget('Icon_Alert.png', 'Notifications'),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          NavigationHelper.navigationHelper
                              .navigateToWidgetAndRemoveAll(
                                  const SignInScreen());
                        },
                        child: _buildAccountWidget('Icon_Exit.png', 'Log out',
                            isShowIcon: false),
                      ),
                    ],
                  ),
                ),
              );
            });
      })),
    );
  }

  _buildAccountWidget(String image, String title, {bool isShowIcon = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 40.w,
              height: 40.h,
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        isShowIcon
            ? RotationTransition(
                turns: const AlwaysStoppedAnimation(90 / 360),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.expand_less_sharp,
                    )),
              )
            : Container(),
      ],
    );
  }
}
