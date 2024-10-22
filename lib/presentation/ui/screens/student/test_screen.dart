import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://lms.bkolpo.com/media/course/1729502249_qFxWa9J.jpg',),)
            ),
          )
        ],
      ),
    );
  }
}
