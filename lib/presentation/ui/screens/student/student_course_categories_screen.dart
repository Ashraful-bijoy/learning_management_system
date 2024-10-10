import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/Advance_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_app_bar_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_drawer_app_bar_icon_button.dart';
import 'package:learning_management_system/presentation/ui/widgets/categories_horizontal_list_view.dart';

class StudentCourseCategoriesScreen extends StatefulWidget {
  const StudentCourseCategoriesScreen({super.key});

  @override
  State<StudentCourseCategoriesScreen> createState() =>
      _StudentCourseCategoriesScreenState();
}

class _StudentCourseCategoriesScreenState
    extends State<StudentCourseCategoriesScreen> {
  final AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvanceDrawer(
      advancedDrawerController: advancedDrawerController,
      drawer: const AdvanceAppBarDrawer(),
      child: Scaffold(
        appBar: AppBar(
          leading: AdvanceDrawerAppBarIconButton(
              advancedDrawerController: advancedDrawerController),
          title: const Padding(
            padding: EdgeInsets.only(
              top: 12,
            ),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey.shade50,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trending',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    child: TrendingCategoriesHorizontalListView(
                      scrollDirection: Axis.horizontal,
                      sizedBox: SizedBox(
                        width: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Browse Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: TrendingCategoriesHorizontalListView(
                          scrollDirection: Axis.vertical,
                          sizedBox: SizedBox(
                            height: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
