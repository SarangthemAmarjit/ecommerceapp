import 'dart:developer';

import 'package:ecommerceapp/config/constants.dart';
import 'package:ecommerceapp/pages/pages/ecommerce_page/cart/componend/product_list.dart';
import 'package:get/get.dart';

class Productcontroller extends GetxController {
  List<Product> _cartproducts = [];
  List<Product> get cartproducts => _cartproducts;

  void addToCart(int productId) {
    log('Adding product with ID $productId to cart');
    // Check if the product is already in the cart
    final existingProductIndex = _cartproducts.indexWhere(
      (product) => product.id == productId,
    );
    if (existingProductIndex != -1) {
      // If it exists, increase the quantity
      _cartproducts[existingProductIndex].quantity += 1;
    } else {
      // If it doesn't exist, add it to the cart with quantity 1
      _cartproducts.add(
        allcartproduct.firstWhere((product) => product.id == productId)
          ..quantity = 1,
      );
    }
    update(); // Notify listeners about the change
  }
}
