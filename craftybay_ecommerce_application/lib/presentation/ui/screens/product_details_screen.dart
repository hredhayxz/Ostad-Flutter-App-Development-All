import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_image_slider.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_name_with_stepper.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_rating_review_wishlist.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/select_product_color.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/select_product_size.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/show_price_and_add_to_cart.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  ProductImageSlider(),
                  const CustomAppBar(title: 'Product Details', elevation: 0,),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductNameWithStepper(
                      productName: 'Addidas Shoe HK23454 - Black Edition',
                    ),
                    ProductRatingReviewWishList(),
                    SectionTitle(title: 'Color'),
                    SizedBox(
                      height: 16,
                    ),
                    SelectProductColor(),
                    SizedBox(
                      height: 16,
                    ),
                    SectionTitle(title: 'Size'),
                    SizedBox(
                      height: 16,
                    ),
                    SelectProductSize(),
                    SizedBox(
                      height: 16,
                    ),
                    SectionTitle(title: 'Description'),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                              '''),
                  ],
                ),
              ),
            ),
            const ShowPriceAndAddToCart(
              price: '\$1000',
            ),
          ],
        ),
      ),
    );
  }
}
