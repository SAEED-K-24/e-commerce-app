import 'package:e_commerce_app/helper/dummydata.dart';
import 'package:e_commerce_app/provider/products_provider.dart';
import 'package:e_commerce_app/view/screens/best_silling_screen.dart';
import 'package:e_commerce_app/view/screens/category_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../helper/navigation_helper.dart';
import '../widgets/best_selling_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  //ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   onWillPop: () async {
        //     if (isDialOpen.value) {
        //       isDialOpen.value = false;
        //       return false;
        //     } else {
        //       return true;
        //     }
        //   },
        //   child:
        Scaffold(
      body: Consumer<ProductsProvider>(
        builder: ((context, value, child) {
          value.getBestSillingProduct();
          int length = value.loadedProducts.length;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildSearchItem(context),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    'Categories',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15.w,
                      ),
                      itemBuilder: (context, index) => _buildCategoryItem(
                          DummyData.dummyCategories[index],
                          DummyData.categoriesImages[index]),
                      itemCount: DummyData.dummyCategories.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Selling',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationHelper.navigationHelper
                              .navigateToWidget(BestSillingScreen());
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BestSellingWidget(
                          image: value.loadedProducts
                              .elementAt(length - 1)!
                              .image!,
                          price: value.loadedProducts
                              .elementAt(length - 1)!
                              .price!,
                          rate:
                              value.loadedProducts.elementAt(length - 1)!.rate!,
                          title: value.loadedProducts
                              .elementAt(length - 1)!
                              .title!,
                          description: value.loadedProducts
                              .elementAt(length - 1)!
                              .description!,
                        ),
                      ),
                      Expanded(
                        child: BestSellingWidget(
                          image: value.loadedProducts
                              .elementAt(length - 2)!
                              .image!,
                          price: value.loadedProducts
                              .elementAt(length - 2)!
                              .price!,
                          rate:
                              value.loadedProducts.elementAt(length - 2)!.rate!,
                          title: value.loadedProducts
                              .elementAt(length - 2)!
                              .title!,
                          description: value.loadedProducts
                              .elementAt(length - 2)!
                              .description!,
                        ),
                      ),
                      // BestSellingWidget(),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),

      //  ),
    );
  }

  _buildCategoryItem(String title, String image) {
    return InkWell(
      onTap: () {
        NavigationHelper.navigationHelper.navigateToWidget(CategoryResultScreen(
          title: title,
        ));
      },
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/$image',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  _buildSearchItem(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      height: 45.h,
      child: const Icon(Icons.search),
    );
  }
}
