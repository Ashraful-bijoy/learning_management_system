import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/data/models/categories_list_data_model.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_course_by_subcategory_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/test_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class CategoriesVerticalListView extends StatefulWidget {
  const CategoriesVerticalListView({
    super.key,
    required this.categoriesList,
  });

  final List<CategoriesListDataModel> categoriesList;

  @override
  _CategoriesVerticalListViewState createState() =>
      _CategoriesVerticalListViewState();
}

class _CategoriesVerticalListViewState
    extends State<CategoriesVerticalListView> {
  // List to track the expansion state of each item
  final List<bool> _isExpanded = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: widget.categoriesList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final category = widget.categoriesList[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the expansion state
                    _isExpanded[index] = !_isExpanded[index];
                  });
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Image(
                          image: AssetImage(
                            AssetsPath.categoriesImage,
                          ),
                          height: 60,
                          width: 50,
                        ),
                        title: Text(
                          category.name ?? 'Unknown',
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                            '${category.subcategoriesList?.length} Subcategory'),
                        trailing: const Icon(Icons.arrow_downward),
                      ),
                      if (_isExpanded[index]) ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Additional information about ${category.name} courses.',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        // Expanded list that looks like the main list
                        Center(
                          child: Column(
                            children: List.generate(
                                category.subcategoriesList!.length,
                                (itemIndex) {
                              final course =
                                  category.subcategoriesList?[itemIndex];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => StudentCourseBySubcategoryScreen(
                                      courses: category
                                          .subcategoriesList?[itemIndex]
                                          .coursesModel,
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  // Gap between items
                                  width: 240,
                                  // Same width as main list
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Center(
                                      child: Text(
                                        course?.name ?? 'Unknown',
                                      ),
                                    ),
                                    subtitle: Text(
                                        course?.description ?? 'Unknown',
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 6),
          ),
        ),
      ],
    );
  }
}
