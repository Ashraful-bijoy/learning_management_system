import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:learning_management_system/presentation/ui/widgets/custom_app_bar_with_search.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomAppBarWithSearch(searchController: _searchController),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 180.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            _selectedIndex.value = index;
                          },
                        ),
                        items: [1, 2, 3].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  color: AppColors.themeColor,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: Image.asset(
                                        AssetsPath.studyingImage,
                                        height: 180,
                                        width: double.maxFinite,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      left: 16,
                                      bottom: 10,
                                      child: _buildSliderProductTitleAndButton(
                                        context,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ValueListenableBuilder(
                          valueListenable: _selectedIndex,
                          builder: (context, currentIndex, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Container(
                                    height: 12,
                                    width: 12,
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      color: currentIndex == i
                                          ? AppColors.themeColor
                                          : null,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                              ],
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderProductTitleAndButton(
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      // Ensures button fits within the screen width
      padding: const EdgeInsets.all(6.0),
      // Padding around text and button
      decoration: BoxDecoration(
        // Semi-transparent background for better readability
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Course title',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.white,
          //     foregroundColor: AppColors.themeColor,
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 6.0,
          //       vertical: 6.0,
          //     ),
          //   ),
          //   child: const Text('Course Title'),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}
