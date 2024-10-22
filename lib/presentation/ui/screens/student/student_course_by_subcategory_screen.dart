import 'package:flutter/material.dart';
import 'package:learning_management_system/data/models/courses_model.dart';
import 'package:learning_management_system/presentation/ui/widgets/course_card_by_subcategory.dart';

class StudentCourseBySubcategoryScreen extends StatefulWidget {
  const StudentCourseBySubcategoryScreen({super.key, required this.courses});

  final List<CoursesModel>? courses;

  @override
  State<StudentCourseBySubcategoryScreen> createState() => _StudentCourseBySubcategoryScreenState();
}

class _StudentCourseBySubcategoryScreenState extends State<StudentCourseBySubcategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Courses'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.courses?.length,
                itemBuilder: (context,index) {
              return CourseCardBySubcategory(course: widget.courses![index],);
            }),
          )
        ],
      ),
    );
  }
}
