import 'package:e_book_store/common/widgets/custom_shapes/containers/rounded_image.dart';
import 'package:e_book_store/models/product_model.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem({
    super.key,
    required this.dark,
    required this.product,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        RoundedImageWidget(
          imageUrl: product.imageLink ?? '',
          height: 60,
          isNetworkImage: true,
          width: 60,
          padding: const EdgeInsets.all(8.0),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: context.width * 0.5,
                child: Text(
                  product.name ?? 'No Title',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Price ', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: '\$${product.price} ',
                  style: Theme.of(context).textTheme.titleLarge)
            ])),
          ],
        ),
      ],
    );
  }
}
