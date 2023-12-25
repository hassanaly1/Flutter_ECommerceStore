import 'package:e_book_store/common/widgets/custom_search_container.dart';
import 'package:e_book_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_book_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_book_store/common/widgets/products/custom_product_card.dart';
import 'package:e_book_store/common/widgets/text/section_heading.dart';
import 'package:e_book_store/controllers/cart_controller.dart';
import 'package:e_book_store/controllers/product_controller.dart';
import 'package:e_book_store/features/home/widgets/home_appbar.dart';
import 'package:e_book_store/features/home/widgets/home_categories.dart';
import 'package:e_book_store/models/product_model.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.put(ProductController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCurvedWidget(
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.only(bottom: 0),
                child: SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -200,
                        right: -280,
                        child: CircularContainer(
                          backgroundColor: AppColors.white.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: CircularContainer(
                          backgroundColor: AppColors.white.withOpacity(0.1),
                        ),
                      ),
                      Column(
                        children: [
                          const HomeAppBar(),
                          const SizedBox(height: AppSizes.spaceBtwSections),
                          SearchContainer(
                            text: 'Search',
                            onChanged: (value) {
                              filterProducts(value);
                            },
                          ),
                          const SizedBox(height: AppSizes.spaceBtwSections),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: AppSizes.defaultSpace),
                            child: Column(
                              children: [
                                SectionHeading(
                                  showActionButton: false,
                                  title: 'Popular Categories',
                                ),
                                SizedBox(height: AppSizes.spaceBtwItems),
                                HomeCategories(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Obx(
                () {
                  if (productController.filteredProducts.isEmpty) {
                    return productController.productList.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : const Center(
                            child: Text('No products found.'),
                          );
                  } else {
                    return GridView.builder(
                      itemCount: productController.filteredProducts.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 16.0,
                        mainAxisExtent: 288,
                      ),
                      itemBuilder: (context, index) {
                        Product product =
                            productController.filteredProducts[index];
                        return CustomProductCard(productModel: product);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterProducts(String keyword) {
    productController.filterProducts(keyword);
  }
}
