import 'package:e_book_store/common/widgets/custom_shapes/containers/circular_icon.dart';
import 'package:e_book_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_book_store/common/widgets/custom_shapes/containers/rounded_image.dart';
import 'package:e_book_store/controllers/cart_controller.dart';
import 'package:e_book_store/features/detail/product_detail_screen.dart';
import 'package:e_book_store/models/product_model.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:e_book_store/utils/constants/utils.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomProductCard extends StatelessWidget {
  final Product productModel;
  CustomProductCard({super.key, required this.productModel});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(ProductDetailScreen(product: productModel),
          transition: Transition.rightToLeft),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: dark ? AppColors.darkerGrey : AppColors.white),
            child: Column(
              children: [
                RoundedContainer(
                  height: context.height * 0.2,
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: dark ? AppColors.dark : AppColors.light,
                  child: Stack(
                    children: [
                      //mainimage
                      RoundedImageWidget(
                        imageUrl:
                            productModel.imageLink ?? 'assets/images/book1.jpg',
                        isNetworkImage: true,
                        fit: BoxFit.cover,
                        applyImageRadius: true,
                      ),
                      //sale tag
                      Positioned(
                        top: 12.0,
                        child: RoundedContainer(
                          radius: 8.0,
                          backgroundColor: AppColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            '25%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: AppColors.black),
                          ),
                        ),
                      ),
                      //favourite icon
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircularIcon(
                          color: Colors.red,
                          icon: Iconsax.heart5,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                //Details
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.name ?? 'No Title',
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productModel.price}',
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (cartController.isInCart(productModel)) {
                          cartController.removeFromCart(productModel);
                          print('book removed');
                          Utils()
                              .toastMessage('Remove from Cart successfully.');
                          print(cartController.cartItems.length);
                        } else {
                          cartController.addToCart(productModel);
                          Utils().toastMessage('Add to Cart successfully.');

                          print('book added');
                          print(cartController.cartItems.length);
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(AppSizes.productImageRadius),
                          ), // BorderRadius.only
                        ), // BoxDecoration
                        child: SizedBox(
                          width: AppSizes.iconLg * 1.2,
                          height: AppSizes.iconLg * 1.2,
                          child: Obx(
                            () => Center(
                                child: Icon(
                                    cartController.isInCart(productModel)
                                        ? Icons.done
                                        : Iconsax.add,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ), // Container
                  ],
                )
              ],
            )),
      ),
    );
  }
}
