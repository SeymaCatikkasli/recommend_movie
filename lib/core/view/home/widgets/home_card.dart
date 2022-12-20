import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardUtility extends StatelessWidget {
  const CardUtility({
    Key? key,
    required this.url,
    required this.category,
  }) : super(key: key);
  final String url;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            category,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(fontSize: 25)),
          ),
          Container(
        height: 70,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage('assets/svgs/$url'),
            fit: BoxFit.contain,
            
          ),
        ),
      ),
        ],
      ),
    );
  }
}
