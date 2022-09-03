import 'dart:developer';

import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/products_provider.dart';
import 'package:e_commerce_app/view/widgets/best_selling_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/navigation_helper.dart';

class CategoryResultScreen extends StatelessWidget {
  String title;
  CategoryResultScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            NavigationHelper.navigationHelper.navigateBack();
          },
        ),
      ),
      body: Consumer<ProductsProvider>(builder: (context, value, child) {
        //log('${value.loadedProducts}');
        return FutureBuilder(
          future: value.getOneCategory(title),
          builder: (ctx, snp) => Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 9,
                //crossAxisSpacing: 10,
                //mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) => BestSellingWidget(
                      image: value.loadedProducts[i]!.image!,
                      title: value.loadedProducts[i]!.title!,
                      rate: value.loadedProducts[i]!.rate!,
                      price: value.loadedProducts[i]!.price!,
                      description:  value.loadedProducts.elementAt(i)!.description!,
                    ),
              itemCount: value.loadedProducts.length,
            ),
          ),
        );
      }),
    );
  }
}
