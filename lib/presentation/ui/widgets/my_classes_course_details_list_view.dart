import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/widgets/my_classes_course_details.dart';

class MyClassesCourseDetailsListView extends StatelessWidget {
  const MyClassesCourseDetailsListView({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index) {
          return MyClassesCourseDetails(rating: rating);
        });
  }
}