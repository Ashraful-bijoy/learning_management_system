import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/controller_binder.dart';
import 'package:learning_management_system/presentation/ui/screens/auth/splash_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';

void main() {
  runApp(const LearningManagementSystem());
}

class LearningManagementSystem extends StatelessWidget {
  const LearningManagementSystem({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeController themeController = Get.put(ThemeController());

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        initialBinding: ControllerBinder(),
        theme: lightThemeData(),
      );

  }

  ThemeData darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xFF121212), // Dark background
      cardColor: const Color(0xFF1E1E1E), // Card background
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.themeColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        titleSmall: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
        bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white), // Ensure body text is visible
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(const TextStyle(fontSize: 11, color: Colors.white)),
      ),
    );
  }

  ThemeData lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.themeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.themeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.themeColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.themeColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
        bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(const TextStyle(fontSize: 11)),
      ),
    );
  }
}

// class ThemeController extends GetxController {
//   var isDarkMode = false.obs;
//
//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//   }
// }
