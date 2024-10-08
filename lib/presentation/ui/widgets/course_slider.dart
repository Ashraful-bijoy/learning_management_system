import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:learning_management_system/presentation/ui/widgets/container_highlighted_text.dart';

class CourseSlider extends StatelessWidget {
  const CourseSlider({
    super.key,
    required ValueNotifier<int> selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final ValueNotifier<int> _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
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
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          AssetsPath.studyingImage,
                          height: 220,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        ),
                      ),
                      _buildCoursePrice(context),
                      _buildCourseTitleAndDuration(context),
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
                      color: currentIndex == i ? AppColors.themeColor : null,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
              ],
            );
          },
        )
      ],
    );
  }

  Widget _buildCoursePrice(BuildContext context) {
    return const Positioned(
      top: 16,
      right: 10,
      child: ContainerHighLightedText(text: '\$100.00',fontSize: 18,),
    );
  }

  Widget _buildCourseTitleAndDuration(BuildContext context) {
    return Positioned(
      left: 16,
      bottom: 10,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
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
            const Row(
              children: [
                Text(
                  'Instructor Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Course Duration',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

