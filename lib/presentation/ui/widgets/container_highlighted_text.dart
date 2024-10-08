import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';

class ContainerHighLightedText extends StatelessWidget {
  const ContainerHighLightedText({
    super.key, required this.text, this.fontSize,
  });

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.themeColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}