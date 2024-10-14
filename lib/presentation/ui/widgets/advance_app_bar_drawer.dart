import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/ui/screens/student/main_bottom_nav_bar_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_home_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_profile_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class AdvanceAppBarDrawer extends StatelessWidget {
  const AdvanceAppBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 128.0,
            height: 128.0,
            margin: const EdgeInsets.only(
              top: 24.0,
              bottom: 64.0,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AssetsPath.studyingImage,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.favorite),
            title: const Text('Favourites'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
          const Spacer(),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: const Text('Terms of Service | Privacy Policy'),
            ),
          ),
        ],
      ),
    );
  }
}
