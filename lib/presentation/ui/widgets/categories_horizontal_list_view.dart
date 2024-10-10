import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class TrendingCategoriesHorizontalListView extends StatelessWidget {
  const TrendingCategoriesHorizontalListView({
    super.key,
    required this.scrollDirection,
    required this.sizedBox,
  });

  final Axis scrollDirection;
  final SizedBox sizedBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: scrollDirection,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const ListTile(
                  leading: Image(
                    image: AssetImage(
                      AssetsPath.businessStrategyIcon,
                    ),
                    height: 60,
                    width: 50,
                  ),
                  title: Text(
                    'Business Strategy',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text('2 courses'),
                ),
              );
            },
            separatorBuilder: (_, __) => sizedBox,
          ),
        ),
      ],
    );
  }
}
