import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle extends StatelessWidget {
  final String data;
  final double fonTSize;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomTextStyle(
      {super.key, required this.data, required this.fonTSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.nunito(
        color: color,
        fontSize: fonTSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
