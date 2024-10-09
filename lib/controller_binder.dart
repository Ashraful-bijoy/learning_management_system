import 'package:get/get.dart';
import 'package:learning_management_system/presentation/state_holders/bottom_nav_bar_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());

  }

}