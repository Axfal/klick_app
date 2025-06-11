// ignore_for_file: avoid_print, prefer_const_declarations, prefer_final_fields, collection_methods_unrelated_type
import 'package:klik_app/models/cart/get_cart_model.dart';
import 'package:klik_app/pages/Auth/email%20section/provider/email_authProvider.dart';
import 'package:klik_app/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  final CartService _cartServices = CartService();
  final Map<int, bool> _cart = {};
  Map<int, bool> get cart => _cart;

  bool isLoading = false;
  GetCartModel? _cartModel;
  GetCartModel? get cartModel => _cartModel;

  // final Map<int, List<String>> _productImage = {};
  // Map<int, List<String>> get productImage => _productImage;
  //
  // List<int> _productIds = [];

  double get totalCartPrice {
    if (_cartModel == null || _cartModel!.cart == null) return 0.0;

    double total = 0.0;
    for (var item in _cartModel!.cart!) {
      if (inCart(item.productId!)) {
        final price = double.tryParse(item.price ?? "0.0") ?? 0.0;
        final quantity = item.quantity ?? 1;
        total += price * quantity;
      }
    }
    return total;
  }

  void updateQuantity(int index, int newQuantity, int productId) {
    cartModel!.cart![index].quantity = newQuantity;
    notifyListeners();

    updateCart(productId, newQuantity);
  }

  void updateCart(int productId, int quantity) async {
    if (_cartModel != null && _cartModel!.cart != null) {
      try {
        int? cartId;
        for (var item in _cartModel!.cart!) {
          if (item.productId == productId) {
            cartId = item.id!;
            break;
          }
        }

        if (cartId != null) {
          await _cartServices.updateCart(cartId, quantity);
        }
      } catch (e) {
        print("Error updating cart item: $e");
        rethrow;
      }
    }
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> deleteCart(int productId) async {
    if (_cartModel != null && _cartModel!.cart != null) {
      try {
        int? cartId;
        int? itemIndex;

        for (int i = 0; i < _cartModel!.cart!.length; i++) {
          if (_cartModel!.cart![i].productId == productId) {
            cartId = _cartModel!.cart![i].id!;
            itemIndex = i;
            break;
          }
        }

        if (cartId != null) {
          await _cartServices.deleteCart(cartId);

          if (itemIndex != null) {
            _cartModel!.cart!.removeAt(itemIndex);
          }

          _cart.remove(productId);
          notifyListeners();

          print('Cart item removed successfully.');
        } else {
          print('Product not found in cart.');
        }
      } catch (e) {
        print('Error deleting cart item: $e');
        rethrow;
      }
    }
  }

  bool inCart(int productId) {
    return _cart[productId] ?? false;
  }

  void addToCart(int productId) {
    _cart[productId] = true;
    print("Updated cart: $_cart");
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _cart.remove(productId);
    notifyListeners();
  }

  void postAddedCart(
    BuildContext context,
    int productId,
    int? variationId,
    int quantity,
    double price,
    double totalPrice,
  ) async {
    final provider = Provider.of<EmailAuthProvider>(context, listen: false);
    // await provider.loadUserSession();
    final userId = provider.user!.id;

    final response = await _cartServices.addToCart(
      userId: userId,
      productId: productId,
      variationId: variationId,
      quantity: quantity,
      price: price,
      totalPrice: totalPrice,
    );
    print("API Response: ${response.toString()}");

    if (response != null && response['success'] != null) {
      addToCart(productId);
      getCart(context);
    } else {
      String errorMessage = response!['message'] ?? 'Unknown error';
      print("Failed to add item to cart. Response: $errorMessage");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add item to cart: $errorMessage')),
      );
    }
  }

  Future<void> getCart(BuildContext context) async {
    setLoading(true);
    final provider = Provider.of<EmailAuthProvider>(context, listen: false);
    // await provider.loadUserSession();
    final userId = provider.user!.id;

    try {
      GetCartModel response = await _cartServices.getCart(userId);

      if (response.success == true &&
          response.cart != null &&
          response.cart!.isNotEmpty) {
        _cartModel = response;
        // _productIds.clear();
        for (var item in _cartModel!.cart!) {
          // _productIds.add(item.productId!);
          _cart[item.productId!] = true;
        }
        print('Cart Items: ${response.cart}');
      } else {
        _cartModel = null;
        print('Failed to fetch cart items or no items in the cart.');
      }

      notifyListeners();
    } catch (e) {
      print('Error fetching cart data: $e');
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
