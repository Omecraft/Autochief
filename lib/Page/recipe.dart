import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipe extends StatelessWidget {
  final String name;
  const Recipe({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2d3250),
      body: Column(
        children: [
          Padding(
           padding: const EdgeInsets.only(top: 100),
           child: Center(
             child: Text(name,style: GoogleFonts.nunito(
              fontSize: 40,
              color: const Color(0xFFffb17a),
              shadows: [
                const Shadow(
                  blurRadius: 5.0,
                  color: Color(0xFFffb17a),
                  offset: Offset(0.0, 0.0),
                ),
              ]
              ),),
           ),
         ),
        ],
      ),
    );
  }
}