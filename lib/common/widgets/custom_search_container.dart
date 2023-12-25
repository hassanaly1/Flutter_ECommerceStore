import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool showBackgroundColor, showBorder;
  final ValueChanged<String>? onChanged;

  SearchContainer({
    Key? key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackgroundColor = true,
    this.showBorder = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.titleSmall,
          prefixIcon: Icon(icon),
          filled: showBackgroundColor,
          fillColor: showBackgroundColor
              ? dark
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
          border: showBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: AppColors.grey),
                )
              : InputBorder.none,
        ),
      ),
    );
  }
}
