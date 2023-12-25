import 'package:e_book_store/controllers/cart_controller.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomCounterWidget extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback onPressed;
  CustomCounterWidget({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Obx(
              () => Center(
                  child: Text(cartController.cartItems.length.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.white, fontSizeFactor: 0.8))),
            ),
          ),
        ),
      ],
    );
  }
}
