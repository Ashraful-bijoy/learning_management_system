import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 5,
      ),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: SizedBox(
          width: 255,
          child: Column(
            children: [
              Container(
                width: 255,
                height: 150,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      AssetsPath.studyingImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Course Title',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.contacts,
                          size: 15,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Linda An..'),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          const Center(
                            child: Text(
                              'Free',
                              style: TextStyle(
                                  color: AppColors.themeColor, fontSize: 13),
                            ),
                          ),
                        Container(
                          width: 75,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade300,
                          ),
                          child: const Center(
                            child: Text(
                              'Text Style',
                              style: TextStyle(
                                  color: AppColors.themeColor, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
