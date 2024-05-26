import 'package:flutter/material.dart';
import 'package:nom_nom_eats/components/my_button.dart';
import 'package:nom_nom_eats/components/my_cart_tile.dart';
import 'package:nom_nom_eats/models/restaurant.dart';
import 'package:nom_nom_eats/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Your Cart"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you confirmed to clear cart?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("Your Cart is Empty"),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              final cartItem = userCart[index];
                              return MyCartTile(cartItem: cartItem);
                            },
                          ),
                        ),
                ],
              ),
            ),
            MyButton(
              text: "Go to Checkout",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}
