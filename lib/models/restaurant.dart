import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nom_nom_eats/models/cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Chicken Kebabs",
      description:
          "Grilled skewered chicken marinated with spices, tender and flavorful bites.",
      imagePath: "lib/images/nonvegstart/chicken_kebabs.png",
      price: 100,
      category: FoodCategory.starter,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Lollipops",
      description:
          "Spicy, deep-fried chicken wings served as a popular appetizer dish.",
      imagePath: "lib/images/nonvegstart/chicken_lollipops.png",
      price: 100,
      category: FoodCategory.starter,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Meatballs",
      description:
          "Savory, tender chicken meatballs with herbs, perfect for any meal.",
      imagePath: "lib/images/nonvegstart/chicken_meatballs.png",
      price: 100,
      category: FoodCategory.starter,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Momos",
      description:
          "Steamed dumplings filled with spiced chicken, popular in South Asia.",
      imagePath: "lib/images/nonvegstart/chicken_momos.png",
      price: 100,
      category: FoodCategory.starter,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Fried Chicken",
      description:
          "Crispy, golden-brown chicken, juicy inside, seasoned to perfection, utterly delicious.",
      imagePath: "lib/images/nonvegstart/chicken_fried.png",
      price: 100,
      category: FoodCategory.starter,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description:
          "Juicy chicken patty, fresh veggies, soft bun, flavorful, satisfying, savory treat.",
      imagePath: "lib/images/oneoffs/chicken_burger.png",
      price: 100,
      category: FoodCategory.oneoff,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Cutlet",
      description:
          "Breaded, fried chicken breast, crispy outside, juicy inside, versatile dish.",
      imagePath: "lib/images/oneoffs/chicken_cutlet.png",
      price: 100,
      category: FoodCategory.oneoff,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Hotdog",
      description: "Savory chicken sausage in a bun, perfect for quick meals.",
      imagePath: "lib/images/oneoffs/chicken_hotdog.png",
      price: 100,
      category: FoodCategory.oneoff,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Pizza",
      description:
          "Savory chicken topping, melted cheese, and tangy tomato sauce on crust.",
      imagePath: "lib/images/oneoffs/chicken_pizza.png",
      price: 100,
      category: FoodCategory.oneoff,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Plain Peas Rice",
      description:
          "Fluffy rice mixed with tender peas, a simple, delicious side dish.",
      imagePath: "lib/images/mains/peas_rice.png",
      price: 100,
      category: FoodCategory.main,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Biriyani",
      description:
          "Fragrant rice cooked with tender chicken, spices, and aromatic herbs.",
      imagePath: "lib/images/mains/chicken_biriyani.png",
      price: 100,
      category: FoodCategory.main,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Fried Rice",
      description:
          "Savory stir-fried rice with tender chicken, veggies, and flavorful seasoning.",
      imagePath: "lib/images/mains/chicken_fried_rice.png",
      price: 100,
      category: FoodCategory.main,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Curry",
      description:
          "Savory blend of tender chicken, aromatic spices in creamy sauce.",
      imagePath: "lib/images/mains/chicken_curry.png",
      price: 100,
      category: FoodCategory.main,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chicken Tomato Curry",
      description:
          "Savory chicken simmered in spicy tomato sauce with aromatic spices.",
      imagePath: "lib/images/mains/chicken_tomato_curry.png",
      price: 100,
      category: FoodCategory.main,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chilli Chicken",
      description:
          "Spicy, tangy, tender chicken with peppers, onions, and flavorful sauce.",
      imagePath: "lib/images/mains/chicken_chilli.png",
      price: 100,
      category: FoodCategory.main,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Chocolate Ice Cream",
      description:
          "Creamy, rich, indulgent delight with a blissful cocoa infusion.",
      imagePath: "lib/images/deserts/chocolate_icecream.png",
      price: 100,
      category: FoodCategory.dessert,
      availableAddons: [
        Addon(name: "Sauce", price: 20),
        Addon(name: "Salad", price: 20),
      ],
    ),
    Food(
      name: "Strawberry Ice Cream",
      description:
          "Creamy, luscious swirls of sweet strawberries in chilly indulgence.",
      imagePath: "lib/images/deserts/strawberry_icecream.png",
      price: 100,
      category: FoodCategory.dessert,
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
