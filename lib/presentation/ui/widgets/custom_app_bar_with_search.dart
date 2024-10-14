import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_add_to_cart_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_notification_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_drawer_app_bar_icon_button.dart';

class CustomAppBarWithSearch extends StatefulWidget {
  const CustomAppBarWithSearch({
    super.key,
    required TextEditingController searchController, required this.advancedDrawerController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final AdvancedDrawerController advancedDrawerController;


  @override
  State<CustomAppBarWithSearch> createState() => _CustomAppBarWithSearchState();
}

class _CustomAppBarWithSearchState extends State<CustomAppBarWithSearch> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.themeColor,
      expandedHeight: 150,
      // Adjust height as needed
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColors.themeColor,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: widget._searchController,
                    decoration: const InputDecoration(
                      hintText: 'What are you going to find?',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search_rounded),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      pinned: true,
      leading: AdvanceDrawerAppBarIconButton(advancedDrawerController: widget.advancedDrawerController,color: Colors.white,),
      title: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Robert Ram..',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              "Let's starting learning!",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => const StudentAddToCartScreen());
          },
          icon: Image.asset(AssetsPath.addToCartIcon,color: Colors.white,height: 23,width: 30,),
        ),
        IconButton(
          onPressed: () {
            Get.to(() => const StudentNotificationScreen());
          },
          icon: Image.asset(AssetsPath.notificationIcon,color: Colors.white,height: 22,width: 25,),
        ),
      ],
    );
  }
}
