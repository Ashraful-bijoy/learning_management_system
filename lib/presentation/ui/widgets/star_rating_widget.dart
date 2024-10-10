import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating; // Rating value from 0 to 5
  final int starCount; // Total number of stars

  const StarRating({
    super.key,
    required this.rating,
    this.starCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16, // Adjust size as needed
        );
      }),
    );
  }
}