import 'package:e_book_store/common/image_text_widgets/image_and_text_widget.dart';
import 'package:e_book_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomTextAndImageWidget(
            onTap: () {},
            title: 'Products',
            icon: Iconsax.archive_book,
          );
        },
      ),
    );
  }
}
