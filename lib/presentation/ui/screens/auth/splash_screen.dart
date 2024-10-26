import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/state_holders/auth/auth_controller.dart';
import 'package:learning_management_system/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/main_bottom_nav_bar_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    bool isLoggedIn = await Get.find<AuthController>().checkAuthState();
    if (isLoggedIn) {
      Get.off(() => const MainBottomNavBarScreen());
    } else {
      Get.off(() => const LogInScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                AssetsPath.logoImage,
                height: 120,
                width: 100,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              color: AppColors.themeColor,
            ),
          ],
        ),
      ),
    );
  }
}
