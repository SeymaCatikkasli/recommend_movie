import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTextWidget extends StatelessWidget {
  const PrimaryTextWidget({
    super.key,
    required this.title,
    required this.fontsize,  this.color, this.style,  this.letterSpacing, 
  });
  final String title;
  final double fontsize;
  final Color? color;
  final TextStyle? style;
  final int? letterSpacing;
  

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style:style?? GoogleFonts.bevan(
            textStyle: TextStyles.textStyle(fontsize, color)));
  }
}
abstract class TextStyles{

static TextStyle textStyle(double fontSize, Color? color){

  return TextStyle(
    color: color?? Colors.black,
                letterSpacing: 1.2,
                wordSpacing: 1.2,
                fontSize: fontSize,
                shadows:  const [
              Shadow(
                  color: Color.fromRGBO(208, 217, 220, 1), offset: Offset(2, 2))
            ]);
            
}

}