import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/Advance_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_app_bar_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/course_categories_and_view_all_button.dart';
import 'package:learning_management_system/presentation/ui/widgets/course_slider.dart';
import 'package:learning_management_system/presentation/ui/widgets/custom_app_bar_with_search.dart';
import 'package:learning_management_system/presentation/ui/widgets/horizontal_course_list_view.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvanceDrawer(
      advancedDrawerController: advancedDrawerController,
      drawer: const AdvanceAppBarDrawer(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: CustomScrollView(
          slivers: [
            CustomAppBarWithSearch(
              searchController: _searchController,
              advancedDrawerController: advancedDrawerController,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Featured Classes',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    CourseSlider(selectedIndex: _selectedIndex),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        _buildNewestClassesSection(),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildBestBundlesSection(),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildBestRatedSection(),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildBestSellingSection(),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildDiscountedClassesSection(),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildFreeClassesSection(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFreeClassesSection() {
    return Column(
      children: [
        CourseCategoriesAndViewALLButton(
          text: 'Free Classes',
          onTap: () {},
        ),
        const HorizontalCourseListView(),
      ],
    );
  }

  Widget _buildDiscountedClassesSection() {
    return Column(
      children: [
        CourseCategoriesAndViewALLButton(
          text: 'Discounted Classes',
          onTap: () {},
        ),
        const HorizontalCourseListView(),
      ],
    );
  }

  Widget _buildBestSellingSection() {
    return Column(
      children: [
        CourseCategoriesAndViewALLButton(
          text: 'Best Selling',
          onTap: () {},
        ),
        const HorizontalCourseListView(),
      ],
    );
  }

  Widget _buildBestRatedSection() {
    return Column(
      children: [
        CourseCategoriesAndViewALLButton(
          text: 'Best Rated',
          onTap: () {},
        ),
        const HorizontalCourseListView(),
      ],
    );
  }

  Widget _buildBestBundlesSection() {
    return Column(
      children: [
        CourseCategoriesAndViewALLButton(
          text: 'Latest Bundles',
          onTap: () {},
        ),
        const HorizontalCourseListView(),
      ],
    );
  }

  Widget _buildNewestClassesSection() {
    return Column(
      children: [
        CourseCategoriesAndViewALLButton(
          text: 'Newest Classes',
          onTap: () {},
        ),
        const HorizontalCourseListView(),
      ],
    );
  }
}
