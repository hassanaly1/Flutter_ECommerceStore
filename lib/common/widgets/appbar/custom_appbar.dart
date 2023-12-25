import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/constants/sizes.dart';
import 'package:e_book_store/utils/device/device_utility.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: AppBar(
            automaticallyImplyLeading: false,
            title: title,
            actions: actions,
            leading: showBackArrow
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Iconsax.arrow_left,
                      color: dark ? AppColors.light : AppColors.darkerGrey,
                    ))
                : leadingIcon != null
                    ? IconButton(
                        onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                    : null));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
