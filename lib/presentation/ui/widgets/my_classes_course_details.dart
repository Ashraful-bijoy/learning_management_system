import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:learning_management_system/presentation/ui/widgets/star_rating_widget.dart';

class MyClassesCourseDetails extends StatelessWidget {
  const MyClassesCourseDetails({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const Image(
                        image: AssetImage(
                          AssetsPath.studyingImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Wrap(
                          children: [
                            Text(
                              'Health And Fitness Masterclass',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        StarRating(rating: rating),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AssetsPath.timeIcon,
                              height: 21,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '1.00 Hours',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '\$16.00',
                              style: TextStyle(color: AppColors.themeColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Health And Fitness',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Publish Date',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        '1 july 2021',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
