import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/helper/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen(
      {Key? key,
      required this.image,
      required this.description,
      required this.price,
      required this.title})
      : super(key: key);
  String? image, description, title;
  double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        height: 60.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PRICE',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                )
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180.h,
                  child: Image.network(
                    '$image',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            NavigationHelper.navigationHelper.navigateBack();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              //borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.star_border_outlined,
                              ))),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 8.w),
                        padding: const EdgeInsets.all(8),
                        height: 40.h,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Size'),
                            Text(
                              'XL',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        padding: const EdgeInsets.all(8),
                        height: 40.h,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Size'),
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "$description",
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.5.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
