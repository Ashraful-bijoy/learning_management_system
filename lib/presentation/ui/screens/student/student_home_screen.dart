import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/widgets/custom_app_bar_with_search.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomAppBarWithSearch(searchController: _searchController),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Column(
                    children: [
                      
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

