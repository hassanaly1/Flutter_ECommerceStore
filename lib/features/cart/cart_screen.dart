import 'package:e_book_store/common/widgets/appbar/custom_appbar.dart';
import 'package:e_book_store/common/widgets/custom_shapes/containers/circular_icon.dart';
import 'package:e_book_store/controllers/cart_controller.dart';
import 'package:e_book_store/features/cart/widgets/cart_item.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:e_book_store/utils/constants/utils.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Obx(
            () => cartController.cartItems.isEmpty
                ? Center(child: Image.asset('assets/images/emptycart.png'))
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (_, index) {
                      final product = cartController.cartItems[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartItem(product: product, dark: dark),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularIcon(
                                  icon: Iconsax.minus,
                                  onTap: () {
                                    cartController.removeFromCart(product);
                                    Utils().toastMessage(
                                        'Remove from Cart successfully.');
                                  },
                                  width: 32,
                                  height: 32,
                                  size: 16.0,
                                  color: AppColors.white,
                                  backgroundColor: AppColors.primary),
                              const SizedBox(height: 10),
                              Text(
                                '\$${product.price}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(height: AppSizes.spaceBtwSections);
                    },
                  ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Obx(() =>
              Text('Checkout \$${Get.find<CartController>().getTotalPrice()}')),
        ),
      ),
    );
  }
}
