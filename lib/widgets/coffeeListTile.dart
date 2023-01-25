import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/size_provider.dart';

class CoffeeListTile extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;
  const CoffeeListTile(
      {super.key, required this.image, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: SizeProvider.widthProvider(context, 0.03), right: SizeProvider.widthProvider(context, 0.03) ),
      leading: Image.asset(image, fit: BoxFit.cover, height: 35, width: 35),
      title: Text(title,
          style: GoogleFonts.nunito(
            fontSize: 18,
          )),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        color: Colors.grey[500],
      ),
    );
  }
}
