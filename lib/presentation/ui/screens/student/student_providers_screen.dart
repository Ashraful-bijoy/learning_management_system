import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/state_holders/teacher_list_controller.dart';
import 'package:learning_management_system/presentation/ui/widgets/Advance_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_app_bar_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_drawer_app_bar_icon_button.dart';
import 'package:learning_management_system/presentation/ui/widgets/providers_details_grid_view.dart';

class StudentProvidersScreen extends StatefulWidget {
  const StudentProvidersScreen({super.key});

  @override
  State<StudentProvidersScreen> createState() => _StudentProvidersScreenState();
}

class _StudentProvidersScreenState extends State<StudentProvidersScreen> {
  final AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();
  final TeacherListController _teacherListController =
      Get.find<TeacherListController>();

  double rating = 4.5;

  @override
  void initState() {
    super.initState();
    Get.find<TeacherListController>().getTeacherList();
  }

  @override
  Widget build(BuildContext context) {
    return AdvanceDrawer(
      advancedDrawerController: advancedDrawerController,
      drawer: const AdvanceAppBarDrawer(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            leading: AdvanceDrawerAppBarIconButton(
                advancedDrawerController: advancedDrawerController),
            title: const Padding(
              padding: EdgeInsets.only(
                top: 12,
              ),
              child: Text(
                'Providers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Instructors'),
                ),
                Tab(
                  child: Text('Consultants'),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: GetBuilder<TeacherListController>(
              builder: (teacherListController) {
            return Visibility(
              visible: !teacherListController.inProgress,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: TabBarView(children: [
                ProvidersDetailsGridView(
                  rating: rating,
                  teacherList: _teacherListController.teacherList,
                ),
                ProvidersDetailsGridView(
                  rating: rating,
                  teacherList: _teacherListController.teacherList,
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
