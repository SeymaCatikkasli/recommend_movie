import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTextWidget extends StatelessWidget {
  const PrimaryTextWidget({super.key, required this.title, required this.fontsize});
  final String title;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.abrilFatface(
            textStyle:  TextStyle(
                letterSpacing: 1.2,
                wordSpacing: 1.2,
                fontSize: fontsize,
                shadows: const [
              Shadow(
                  color: Color.fromRGBO(208, 217, 220, 1), offset: Offset(2, 2))
            ])));
  }
}