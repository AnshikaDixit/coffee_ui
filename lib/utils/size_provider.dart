import 'package:flutter/material.dart';

class SizeProvider {

  static heightProvider(BuildContext context, double height) {
    return MediaQuery.of(context).size.height*height;
  }

  static widthProvider(BuildContext context, double width) {
    return MediaQuery.of(context).size.width*width;
  }
}



