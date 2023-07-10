import 'package:flutter/material.dart';

class ShoppingListPage extends StatelessWidget {
  ShoppingListPage({super.key});

  void showEmptyCartSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  final List<String> shoppingItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
             showEmptyCartSnackbar(context, 'Cart is empty');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: shoppingItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: Text(
                shoppingItems[index],
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}