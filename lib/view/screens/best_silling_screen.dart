import 'package:e_commerce_app/provider/products_provider.dart';
import 'package:e_commerce_app/view/widgets/best_selling_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/navigation_helper.dart';

class BestSillingScreen extends StatelessWidget {
  const BestSillingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        title: const Text(
          'Best Silling Screen',
          style: TextStyle(color: Colors.black),
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
            future: value.getBestSillingProduct(),
            builder: (ctx, snp) {
              int length = value.loadedProducts.length;
              return Container(
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
                    image: value.loadedProducts[(length - 1) - i]!.image!,
                    title: value.loadedProducts[(length - 1) - i]!.title!,
                    rate: value.loadedProducts[(length - 1) - i]!.rate!,
                    price: value.loadedProducts[(length - 1) - i]!.price!,
                    description:
                        value.loadedProducts[(length - 1) - i]!.description!,
                  ),
                  itemCount: 10,
                ),
              );
            });
      }),
    );
  }
}
