import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:learning_management_system/presentation/ui/widgets/star_rating_widget.dart';

class ProvidersDetailsGridView extends StatelessWidget {
  const ProvidersDetailsGridView({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.88,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
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
                    const SizedBox(
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          AssetsPath.studyingImage,
                        ),
                        radius: 50,
                      ),
                    ),
                    const ListTile(
                      title: Center(
                        child: Text(
                          'Instructor Name',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      subtitle: Center(
                        child: Text('Software Engineer',style: TextStyle(fontSize: 12),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StarRating(rating: rating),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}