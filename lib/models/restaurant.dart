import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nom_nom_eats/models/cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Amritsari Fish Tikka",
      description: "Great Amritsari Fish Tikka",
      imagePath: "lib/images/nonvegstart/amritsari_fish_tikka.jpg",
      price: 100,
      category: FoodCategory.startersN,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Andhra Chilli Chicken",
      description: "Andhra Chilli Chicken",
      imagePath: "lib/images/nonvegstart/andhra_chilli_chicken.jpg",
      price: 100,
      category: FoodCategory.startersN,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Butter Chicken Balls",
      description: "Butter Chicken Balls",
      imagePath: "lib/images/nonvegstart/butter_chicken_meatballs.jpg",
      price: 100,
      category: FoodCategory.startersN,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken 65",
      description: "Chicken 65",
      imagePath: "lib/images/nonvegstart/chicken_65.jpg",
      price: 100,
      category: FoodCategory.startersN,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Momos",
      description: "Chicken Momos",
      imagePath: "lib/images/nonvegstart/chicken_momos.jpg",
      price: 100,
      category: FoodCategory.startersN,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
  ];

  final List<CartItem> _cart = [];

  String _deliveryAddress = "Heisenberg's Home, The Lab";

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your Receipt");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddOns(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("---------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)}";
  }

  String _formatAddOns(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
