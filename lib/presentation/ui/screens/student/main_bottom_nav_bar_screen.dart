import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_course_categories_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_home_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_my_classes_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_profile_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_providers_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final BottomNavBarController _bottomNavBarController =
      Get.find<BottomNavBarController>();

  final List<Widget> _screens = [
    const StudentHomeScreen(),
    const StudentCourseCategoriesScreen(),
    const StudentProvidersScreen(),
    const StudentMyClassesScreen(),
    const StudentProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (__) {
      return Scaffold(
        body: _screens[_bottomNavBarController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: _bottomNavBarController.selectedIndex,
          onDestinationSelected: _bottomNavBarController.changeIndex,
          destinations: const [
            NavigationDestination(
                icon: ImageIcon(
                  AssetImage(AssetsPath.homeIcon),
                ),
                label: 'Home'),
            NavigationDestination(
                icon: ImageIcon(
                  AssetImage(AssetsPath.categoryIcon),
                ),
                label: 'Categories'),
            NavigationDestination(
                icon: ImageIcon(
                  AssetImage(AssetsPath.providerIcon),
                ),
                label: 'Providers'),
            NavigationDestination(
                icon: ImageIcon(
                  AssetImage(AssetsPath.myClassesIcon),
                ),
                label: 'My Classes'),
            NavigationDestination(
                icon: ImageIcon(
                  AssetImage(AssetsPath.profileIcon),
                ),
                label: 'Profile'),
          ],
        ),
      );
    });
  }
}
