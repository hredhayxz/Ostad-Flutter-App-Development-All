import 'package:flutter/material.dart';
import 'ProductList.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  const CartPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    int totalQuantity = products.fold(0, (sum, product) => sum + product.quantity);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalQuantity'),
      ),
    );
  }
}