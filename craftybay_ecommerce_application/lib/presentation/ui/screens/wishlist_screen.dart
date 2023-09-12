import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/reusable_appbar.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ReusableAppBar(
          title: 'WishList',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: const FittedBox(
                child: ProductCard(),
              ),
            );
          },
        ),
      ),
    );
  }
}