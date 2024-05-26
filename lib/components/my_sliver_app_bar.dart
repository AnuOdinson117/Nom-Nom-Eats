import 'package:flutter/material.dart';
import 'package:nom_nom_eats/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart_rounded),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Nom Nom Cafe"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 0,
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
