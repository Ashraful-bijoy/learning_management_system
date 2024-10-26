import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/data/models/teacher_details_data_model.dart';
import 'package:learning_management_system/presentation/state_holders/teacher_list_controller.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class StudentProvidersDetailsScreen extends StatefulWidget {
  const StudentProvidersDetailsScreen({
    super.key,
    required this.teacherListData,
    required this.index,
  });

  final List<TeacherDetailsDataModel> teacherListData;
  final int index;

  @override
  State<StudentProvidersDetailsScreen> createState() =>
      _StudentProvidersDetailsScreenState();
}

class _StudentProvidersDetailsScreenState
    extends State<StudentProvidersDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Get.find<TeacherListController>().getTeacherList();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final teacher = widget.teacherListData[widget.index];
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade50, // Set a consistent color
            expandedHeight: 450,
            pinned: true,
            elevation: 0, // Remove any shadow
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    SizedBox(
                      height: 160,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://lms.bkolpo.com${teacher.image}',
                        ),
                        radius: 50,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      teacher.teacherProfileData?.username ?? 'Unknown',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      teacher.tagline ?? 'Unknown',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatColumn('Classes', AssetsPath.providerClassesIcon),
                        const SizedBox(width: 30),
                        _buildStatColumn('Students', AssetsPath.providerStudentsIcon),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            toolbarHeight: 50,
            title: const Text(
              'Provider Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              TabBar(
                controller: _tabController,
                indicatorColor: AppColors.themeColor,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'About'),
                  Tab(text: 'Classes'),
                  Tab(text: 'Badges'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutSection(),
                  _buildAboutSection(),
                  _buildAboutSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String title, String assetPath) {
    return Column(
      children: [
        Image.asset(
          assetPath,
          height: 60,
          width: 60,
        ),
        const SizedBox(height: 8),
        const Text(
          '0',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Center(
            child: Text(
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Experiences',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          SizedBox(height: 20),
          Text('Additional content...', style: TextStyle(fontSize: 14)),
          SizedBox(height: 30),
          Text('Certifications', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar; // Rebuild if the TabBar is different
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.grey.shade50, // Ensure TabBar has consistent color
      child: tabBar,
    );
  }
}
