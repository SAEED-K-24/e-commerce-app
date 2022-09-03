import 'package:cloud_firestore/cloud_firestore.dart';

//enum Category { Men, Women, Devices, Gadgets, Gaming }

class Product {
  int? id, count;
  Timestamp? timestamp;
  String? title;
  String? image;
  String? category;
  //String? hint;
  String? description;
  double? price, rate;

  bool? isFavourite = false;

  Product({
    this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.rate,
    required this.count,
    // required this.hint,
    required this.category,
    required this.price,
    this.timestamp,
    this.isFavourite,
  });

  Product.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    id = map['id'];
    title = map['title'];
    image = map['image'];
    category = map['category'];
    //hint = map['hint'];
    description = map['description'];
    price = map['price'];
    rate = map['rating']['rate'];
    count = map['rating']['count'];
  }

  toJson() {
    return {
      'title': title,
      'image': image,
      //'hint': hint,
      'category': category,
      'description': description,
      'price': price,
    };
  }
}
