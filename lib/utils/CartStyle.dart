// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartStyle extends StatelessWidget {
  final String data;
  final double? fonTSize;
  const CartStyle({super.key, required this.data, this.fonTSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.nunito(
        color: Colors.brown,
        fontSize: fonTSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}