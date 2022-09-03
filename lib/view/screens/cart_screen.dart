import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/helper/navigation_helper.dart';
import 'package:e_commerce_app/provider/carts_provider.dart';
import 'package:e_commerce_app/view/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../helper/utils.dart';
import '../widgets/dismissible_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartsProvider>(builder: (context, value, child) {
      return FutureBuilder(
        future: value.products.isEmpty
            ? value.getAllProductInCart()
            : value.getNothing(),
        builder: (context, child) => Scaffold(
          bottomSheet: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
            //margin: EdgeInsets.only(top: 20.h),
            height: 70.h,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TOTAL',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$${value.totalPrice().toStringAsFixed(2)}',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    NavigationHelper.navigationHelper
                        .navigateToWidget(const CheckoutScreen());
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Text(
                        'CHECKOUT',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DismissibleWidget(
                      item: index,
                      child: _buildCartItem(
                        context: context,
                        image: value.products[index].image!,
                        price: value.products[index].price!,
                        quantity: value.quantity[index],
                        title: value.products[index].title!,
                        i: index,
                      ),
                      onDismissed: (direction) =>
                          dismissItem(context, index, direction),
                    );
                  },
                  separatorBuilder: (ctx, i) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: value.products.length),
            ),
          ),

          //}),
        ),
      );
    });
  }

  void dismissItem(
    BuildContext context,
    int index,
    DismissDirection direction,
  ) {
    switch (direction) {
      case DismissDirection.endToStart:
        Utils.showSnackBar(context, 'Cart has been deleted');
        break;
      case DismissDirection.startToEnd:
        Utils.showSnackBar(context, 'Cart has been archived');
        break;
      default:
        break;
    }
  }

  _buildCartItem(
      {required BuildContext context,
      required String image,
      required String title,
      required double price,
      required int quantity,
      required int i}) {
    double newprice = price * quantity;

    return SizedBox(
      width: double.infinity,
      height: 140.h,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 130.h,
            width: 130.w,
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    // overflow: TextOverflow.visible,
                  ),
                  // softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                // SizedBox(height: 8.h),
                Text(
                  '\$ $newprice',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                Container(
                  height: 30.h,
                  width: 120.w,
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Provider.of<CartsProvider>(context, listen: false)
                                .changeQuantity(i, quantity + 1);
                          },
                          icon: const Icon(Icons.add)),
                      Text('$quantity'),
                      IconButton(
                          onPressed: () {
                            Provider.of<CartsProvider>(context, listen: false)
                                .changeQuantity(i, quantity - 1);
                          },
                          icon: const Icon(
                            Icons.minimize,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
