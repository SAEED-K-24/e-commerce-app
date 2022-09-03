import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_app/helper/dummydata.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  List<Product?> loadedProducts = [];

  getOneCategory(String category) {
    List<Product?> products = [];
    for (int i = 0; i < DummyData.dummyProducts.length; i++) {
      if (DummyData.dummyProducts.elementAt(i)['category'] == category) {
        products.add(Product.fromJson(DummyData.dummyProducts.elementAt(i)));
      }
    }
    loadedProducts = products;
    notifyListeners();
  }

  getAllProduct() {
    List<Product?> products = [];
    for (int i = 0; i < DummyData.dummyProducts.length; i++) {
      products.add(Product.fromJson(DummyData.dummyProducts.elementAt(i)));
    }
    loadedProducts = products;
    //notifyListeners();
  }

  Product? findProductById(int id) {
    getAllProduct();
    return loadedProducts.firstWhere((element) => element!.id == id);
  }

  getBestSillingProduct()  {
    List<Product?> products = [];
    for (int i = 0; i < DummyData.dummyProducts.length; i++) {
      products.add(Product.fromJson(DummyData.dummyProducts.elementAt(i)));
    }
    quickSort(products, 0, products.length);
    loadedProducts = products;
    //notifyListeners();
  }

  void quickSort(List<Product?> input, int start, int end) {
    if (end - start < 2) {
      return;
    }

    int pivotIndex = partition(input, start, end);
    quickSort(input, start, pivotIndex);
    quickSort(input, pivotIndex + 1, end);
  }

  int partition(List<Product?> input, int start, int end) {
    // This is using the first element as the pivot
    double pivot = input[start]!.rate!;
    int i = start;
    int j = end;

    while (i < j) {
      // NOTE: empty loop body
      while (i < j && input[--j]!.rate! >= pivot);
      if (i < j) {
        input[i] = input[j];
      }

      // NOTE: empty loop body
      while (i < j && input[++i]!.rate! <= pivot);
      if (i < j) {
        input[j] = input[i];
      }
    }

    input[j]!.rate = pivot;
    return j;
  }
}
