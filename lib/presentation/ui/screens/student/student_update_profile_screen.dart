import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:learning_management_system/presentation/ui/widgets/Advance_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_app_bar_drawer.dart';
import 'package:learning_management_system/presentation/ui/widgets/advance_drawer_app_bar_icon_button.dart';
import 'package:lottie/lottie.dart';

class StudentUpdateProfileScreen extends StatefulWidget {
  const StudentUpdateProfileScreen({super.key});

  @override
  State<StudentUpdateProfileScreen> createState() => _StudentUpdateProfileScreenState();
}

class _StudentUpdateProfileScreenState extends State<StudentUpdateProfileScreen> {
  final AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvanceDrawer(
      advancedDrawerController: advancedDrawerController,
      drawer: const AdvanceAppBarDrawer(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: AdvanceDrawerAppBarIconButton(
              advancedDrawerController: advancedDrawerController),
          title: const Padding(
            padding: EdgeInsets.only(
              top: 12,
            ),
            child: Text(
              'Update Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
            child: Column(
              children: [
                Center(
                  child: Lottie.asset(
                    AssetsPath.profileAnimation,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Number',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Retype Password',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
