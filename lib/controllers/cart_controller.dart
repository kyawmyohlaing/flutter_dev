import 'package:flutter_dev/models/cart_model.dart';
import 'package:flutter_dev/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print("adding item to the cart" +
          product.id!.toString() +
          "quantity" +
          quantity.toString());
      return CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExit: true,
        time: DateTime.now().toString(),
      );
    });
  }
}
