import 'package:flutter/material.dart';
import '../constants/fixed_numbers.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    // double availableHeight = MediaQuery.of(context).size.height;
    double availableWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? availableWidth,
        height: height ?? 40,
        decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(fixedBorderRadius * 4)),
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}
