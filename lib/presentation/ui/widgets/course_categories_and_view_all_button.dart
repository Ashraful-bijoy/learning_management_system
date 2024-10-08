import 'package:flutter/material.dart';

class CourseCategoriesAndViewALLButton extends StatelessWidget {
  const CourseCategoriesAndViewALLButton({
    super.key, required this.text, this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge,
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            'View all',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}