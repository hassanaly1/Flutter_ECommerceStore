import 'package:e_book_store/common/widgets/appbar/custom_appbar.dart';
import 'package:e_book_store/common/widgets/appbar/custom_counter_widget.dart';
import 'package:e_book_store/features/cart/cart_screen.dart';
import 'package:e_book_store/models/product_model.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back!',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.grey)),
          Text('Hassan Ali',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.white))
        ],
      ),
      actions: [
        CustomCounterWidget(
          onPressed: () =>
              Get.to(CartScreen(), transition: Transition.upToDown),
          iconColor: AppColors.white,
        )
      ],
    );
  }
}
