import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/data/models/teacher_details_data_model.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_providers_details_screen.dart';
import 'package:learning_management_system/presentation/ui/widgets/star_rating_widget.dart';

class ProvidersDetailsGridView extends StatefulWidget {
  const ProvidersDetailsGridView({
    super.key,
    required this.rating,
    required this.teacherList,
  });

  final double rating;
  final List<TeacherDetailsDataModel> teacherList;

  @override
  State<ProvidersDetailsGridView> createState() =>
      _ProvidersDetailsGridViewState();
}

class _ProvidersDetailsGridViewState extends State<ProvidersDetailsGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.teacherList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.88,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        final teacher = widget.teacherList[index];
        return GestureDetector(
          onTap: () {
            Get.to(
              () => StudentProvidersDetailsScreen(
                  teacherListData: widget.teacherList, index: index),
            );
          },
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 5,
                right: 5,
              ),
              child: Card(
                elevation: 0,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 80,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://lms.bkolpo.com${teacher.image}',
                          ),
                          radius: 50,
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            teacher.teacherProfileData?.username ?? 'Unknown',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        subtitle: const Center(
                          child: Text(
                            'Software Engineer',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StarRating(rating: widget.rating),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
