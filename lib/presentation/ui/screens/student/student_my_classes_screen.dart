import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/Advance_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_app_bar_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_drawer_app_bar_icon_button.dart';
import 'package:learning_management_system/presentation/ui/widgets/my_classes_course_details_list_view.dart';

class StudentMyClassesScreen extends StatefulWidget {
  const StudentMyClassesScreen({super.key});

  @override
  State<StudentMyClassesScreen> createState() => _StudentMyClassesScreenState();
}

class _StudentMyClassesScreenState extends State<StudentMyClassesScreen> {
  final AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();
  double rating = 4.5;

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
                'My Classes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Purchased'),
                ),
                Tab(
                  child: Text('My Courses'),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: [
              MyClassesCourseDetailsListView(rating: rating),
              MyClassesCourseDetailsListView(rating: rating),
            ],
          ),
        ),
      ),
    );
  }
}
