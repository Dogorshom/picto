import 'package:flutter/material.dart';


class SingleImage {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? category;
  final bool? isPremium;
  final double? price;
  final String? imageClass;
  // final bool? isFavourite;
  final List<Color>? containColors;

  SingleImage({
    required this.id,
    required this.title,
    this.description,
    required this.imageUrl,
    this.category,
    this.isPremium,
    this.price,
    this.imageClass,
    this.containColors,
  });
}
