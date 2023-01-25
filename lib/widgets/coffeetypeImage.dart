import 'package:flutter/material.dart';

class CoffeeTypeImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const CoffeeTypeImage(
      {super.key, required this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, height: height, width: width);
  }
}
