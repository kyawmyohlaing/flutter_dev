import 'package:flutter/material.dart';
import 'package:flutter_dev/models/cart_model.dart';
import 'package:flutter_dev/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (vlaue) {
        return CartModel(
          id: vlaue.id,
          name: vlaue.name,
          price: vlaue.price,
          img: vlaue.img,
          quantity: vlaue.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          //print("adding item to the cart" +
          //    product.id!.toString() +
          //    "quantity" +
          //    quantity.toString());
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
      } else {
        Get.snackbar(
          "Item count",
          "You should at least add an item in the cart!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    //}
    //);
  }
  // print("Length of the item is" + _items.length.toString());
  // _items.forEach((key, value) {
  //   print("quantity is " + value.quantity.toString());
  // });

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
