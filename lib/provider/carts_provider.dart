import 'dart:developer';

import 'package:e_commerce_app/model/cart.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/products_provider.dart';
import 'package:flutter/cupertino.dart';

import '../helper/dummydata.dart';

class CartsProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Cart> carts = [];
  List<int> quantity = [];

  double totalPrice() {
    double price = 0;
    for (int i = 0; i < products.length; i++) {
      double p = products[i].price! * quantity[i];
      price += p;
    }

    return price;
  }

  getCartToUser() {
    List<Cart> loadedCarts = [];
    for (int i = 0; i < DummyData.dummyCarts.length; i++) {
      if (DummyData.dummyCarts.elementAt(i)['userId'] == 1) {
        loadedCarts.add(Cart.fromJson(DummyData.dummyCarts.elementAt(i)));
      }
    }
    carts = loadedCarts;
  }

  getAllCarts() {
    List<Cart> loadedCarts = [];
    for (int i = 0; i < DummyData.dummyCarts.length; i++) {
      loadedCarts.add(Cart.fromJson(DummyData.dummyCarts.elementAt(i)));
    }
    carts = loadedCarts;
  }

  getNothing() {
    print('nothing');
  }

  getAllProductInCart() {
    List<Product> loadedProducts = [];
    List<int> loadedQuantity = [];
    //getAllCarts();
    // get cart to user 1
    getCartToUser();

    for (int i = 0; i < carts.length; i++) {
      for (int j = 0; j < carts[i].products!.length; j++) {
        loadedProducts.add(ProductsProvider()
            .findProductById(carts[i].products![j].productId!)!);
        loadedQuantity.add(carts[i].products![j].quantity!);
      }
    }

    products = loadedProducts;
    quantity = loadedQuantity;

//    notifyListeners();
  }

  void changeQuantity(int i, int q) {
    quantity[i] = q;
    log('${quantity[i]}');
    notifyListeners();
  }
}
