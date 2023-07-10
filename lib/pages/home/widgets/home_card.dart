import 'package:flutter/material.dart';
import 'package:picto/models/single_image.dart';

class HomeCard extends StatelessWidget {
  final SingleImage image;
  const HomeCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.5,
      width: height * 0.4,
      child: Text(image.title!),
    );
  }
}
