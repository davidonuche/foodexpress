import 'package:flutter/material.dart';
import 'package:foodexpress/service/cart_model.dart';

class CartService extends ChangeNotifier {
  final List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  void addcart(CartModel cart, BuildContext context) {
    _carts.add(cart);
    notifyListeners();
    showAlert(context, "Item added to cart");
  }

  void deletecart(CartModel cart, BuildContext context) {
    _carts.remove(cart);
    notifyListeners();
    showAlert(context, "Item delete to cart");
  }

  void updatecart(CartModel cart, BuildContext context) {
    int index = _carts.indexWhere((element) => element.id == cart.id);
    _carts[index] = cart;
    notifyListeners();
    showAlert(context, "Item update to cart");
  }

  void deleteAllcarts(BuildContext context) {
    _carts.clear();
    notifyListeners();
    showAlert(context, "All items deleted from cart");
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAlert(
      BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
