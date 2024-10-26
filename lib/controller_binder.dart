import 'package:get/get.dart';
import 'package:learning_management_system/data/services/network_caller.dart';
import 'package:learning_management_system/presentation/state_holders/ai_content_controller.dart';
import 'package:learning_management_system/presentation/state_holders/auth/auth_controller.dart';
import 'package:learning_management_system/presentation/state_holders/auth/log_in_controller.dart';
import 'package:learning_management_system/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:learning_management_system/presentation/state_holders/categories_list_controller.dart';
import 'package:learning_management_system/presentation/state_holders/teacher_list_controller.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(Logger());
    Get.put(
      NetworkCaller(logger: Get.find<Logger>()),
    );
    Get.put(AuthController());
    Get.put(LogInController());
    Get.put(BottomNavBarController());
    Get.put(TeacherListController());
    Get.put(CategoriesListController());
    Get.put(AiContentController());

  }
}
