import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/widgets/course_card.dart';

class HorizontalCourseListView extends StatelessWidget {
  const HorizontalCourseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 282,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index) {
            return const CourseCard();
          }
      ),
    );
  }
}