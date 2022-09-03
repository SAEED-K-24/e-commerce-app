import 'dart:developer';

class Cart {
  String? date;
  int? id, userId;
  List<ProductInCart>? products;

  Cart.fromJson(Map<dynamic, dynamic> map) {
    id = map['id'];
    userId = map['userId'];
    date = map['date'];
    // List<Map<String, dynamic>> productsList =
    //     List<Map<String, dynamic>>.from(map['products']);
    //products = productsList.map((e) => ProductInCart.fromJson(e)).toList();
    List<Map<dynamic, dynamic>> list = map['products'];
    //log('list $list');
    products = list.map((e) => ProductInCart.fromJson(e)).toList();
  }
}

class ProductInCart {
  int? productId, quantity;

  ProductInCart({
    required this.productId,
    required this.quantity,
  });

  ProductInCart.fromJson(Map<dynamic, dynamic> map) {
    
    productId = map['productId'];
    quantity = map['quantity'];
  }
}
