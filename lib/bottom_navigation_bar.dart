import 'package:e_book_store/features/home/screens/home_screen.dart';
import 'package:e_book_store/utils/constants/colors.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunctions.isDarkMode(context);
    final navigationController = Get.put(NavigationController());
    return Scaffold(
      body: Obx(
        () => navigationController
            .screens[navigationController.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? AppColors.black : AppColors.white,
          indicatorColor: darkMode
              ? AppColors.white.withOpacity(0.1)
              : AppColors.black.withOpacity(0.1),
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (value) =>
              navigationController.selectedIndex.value = value,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    Container(color: Colors.greenAccent),
  ];
}
