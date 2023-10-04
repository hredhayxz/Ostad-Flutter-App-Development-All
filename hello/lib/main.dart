import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_product_list_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/category_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/home/home_screen_appbar_title.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/home/home_slider.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_listview.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/home/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const HomeScreenAppbarTitle(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSlidersController>(
                  builder: (homeSliderController) {
                if (homeSliderController.getHomeSlidersInProgress) {
                  return const SizedBox(
                    height: 180.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavScreenController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  if (categoryController.getCategoriesInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                    height: 90,
                    child: ListView.builder(
                      itemCount: categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final categoryProductListController =
                            Get.put(CategoryProductListController()); // Create controller
                        return GestureDetector(
                          onTap: () async {
                            await categoryProductListController
                                .getProductsByCategory(index + 1);
                            Get.to(() => ProductListScreen(
                                productData:
                                    categoryProductListController.productModel
                                            .data ??
                                        [],
                                remarkName: categoryController.categoryModel
                                        .data![index].categoryName ??
                                    ''));
                          },
                          child: CategoryCard(
                            categoryData:
                                categoryController.categoryModel.data![index],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              // ... Continue with other sections and GetBuilder widgets
            ],
          ),
        ),
      ),
    );
  }
}
