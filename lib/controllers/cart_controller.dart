import 'dart:convert';

import 'package:e_book_store/models/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  static const String cartItemsKey = 'cart_items';

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void addToCart(Product product) {
    cartItems.add(product);
    saveCartItems();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    saveCartItems();
  }

  bool isInCart(Product product) {
    return cartItems.contains(product);
  }

  double getTotalPrice() {
    double total = cartItems.fold(0, (sum, product) {
      if (product.price != null) {
        return sum + double.parse(product.price!);
      } else {
        return sum;
      }
    });
    return double.parse(total.toStringAsFixed(2));
  }

  void saveCartItems() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartItemsJson =
          cartItems.map((product) => productToJson([product])).toList();
      prefs.setStringList(cartItemsKey, cartItemsJson);
      print('Added cart items in local storage');
    } catch (e) {
      print('Error saving cart items: $e');
    }
  }

  void loadCartItems() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? cartItemsJson = prefs.getStringList(cartItemsKey);

      if (cartItemsJson != null) {
        cartItems.assignAll(cartItemsJson.map((json) {
          try {
            final dynamic decodedJson = jsonDecode(json);
            if (decodedJson is List) {
              return Product.fromJson(decodedJson.first);
            } else if (decodedJson is Map<String, dynamic>) {
              return Product.fromJson(decodedJson);
            } else {
              return Product();
            }
          } catch (e) {
            print('Error decoding JSON: $e');
            return Product();
          }
        }));
      }
    } catch (e) {
      print('Error loading cart items: $e');
    }
  }
}
