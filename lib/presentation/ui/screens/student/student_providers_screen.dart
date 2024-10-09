import 'package:flutter/material.dart';

class StudentProvidersScreen extends StatefulWidget {
  const StudentProvidersScreen({super.key});

  @override
  State<StudentProvidersScreen> createState() => _StudentProvidersScreenState();
}

class _StudentProvidersScreenState extends State<StudentProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Course Providers'),
      ),
    );
  }
}
