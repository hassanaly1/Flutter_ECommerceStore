import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTextAndImageWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final IconData icon;
  final Color? backgroundColor;
  final void Function()? onTap;
  const CustomTextAndImageWidget({
    super.key,
    required this.title,
    required this.icon,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (dark ? AppColors.black : AppColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Icon(icon, color: AppColors.black)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
