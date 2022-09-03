import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/helper/navigation_helper.dart';
import 'package:e_commerce_app/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellingWidget extends StatelessWidget {
  String title, image,description;
  double price, rate;

  BestSellingWidget({
    Key? key,
    required this.image,
    required this.price,
    required this.title,
    required this.rate,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () async {
              // ProductsProvider productsProvider = ProductsProvider();
              // log('${productsProvider.products.length}');
              NavigationHelper.navigationHelper
                  .navigateToWidget( ProductDetailsScreen(description: description, image: image, price: price, title: title,));
            },
            child: SizedBox(
              height: 200.h,
              width: MediaQuery.of(context).size.width * 0.43,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage('assets/images/product.png'),
              //       fit: BoxFit.fill),
              // ),
            ),
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                overflow: TextOverflow.ellipsis),
            maxLines: 1,
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          Text(
            'rate : $rate',
            style: TextStyle(color: Colors.grey, fontSize: 10.sp),
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          Text(
            '$price\$',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
